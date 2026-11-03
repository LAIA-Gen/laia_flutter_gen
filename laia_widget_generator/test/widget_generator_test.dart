import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as api;
import 'package:http/testing.dart';
import 'generated/listing.dart';
import 'generated/listing.dart' as generated;

void main() {
  testWidgets('empty results offer no invalid page zero', (tester) async {
    final pages = <int>[];
    await tester.pumpWidget(MaterialApp(
        home: CustomPagination(
      currentPage: 1,
      maxPages: 0,
      onPageSelected: pages.add,
    )));
    expect(find.text('No results'), findsOneWidget);
    expect(find.byType(InkWell), findsNothing);
    expect(pages, isEmpty);
  });

  test('displayed relation paths are searchable with their actual types', () {
    final source = File('test/generated/list_source.txt').readAsStringSync();
    expect(source, contains("'roles.name': 'String?'"));
    expect(source, contains("'roles.rank': 'int?'"));
    expect(
        source,
        contains(
            "{'id': 'roles', 'from': 'Role', 'fields': ['name', 'rank']}"));
    expect(source, contains('orders: columnSortStates, onSort: onSort'));
    final plain = File('test/generated/plain_source.txt').readAsStringSync();
    expect(plain, contains("_sortHeader('value', 'Display label', style)"));
  });

  test('filter and order changes restart pagination and preserve snapshots',
      () {
    final notifier = UserPaginationNotifier();
    addTearDown(notifier.dispose);
    final filters = <String, dynamic>{
      'roles.name': {r'$regex': 'seeker', r'$options': 'i'}
    };
    notifier.setFilters(filters);
    final previous = notifier.state;
    filters.clear();
    expect(previous.filters, contains('roles.name'));
    notifier.setPage(3);
    expect(notifier.state.pagination.item1, 4);
    final orders = {'name': 1};
    notifier.setOrders(orders);
    orders['name'] = -1;
    expect(notifier.state.pagination.item1, 0);
    expect(notifier.state.orders, {'name': 1});
    expect(notifier.state.filters, previous.filters);
    notifier.setPage(2);
    expect(notifier.state.orders, {'name': 1});
    notifier.setFilters({});
    expect(notifier.state.pagination.item1, 0);
    expect(notifier.state.orders, {'name': 1});
    expect(previous.filters, contains('roles.name'));
  });

  testWidgets('column headers use field paths and indicate both directions',
      (tester) async {
    final notifier = UserPaginationNotifier();
    addTearDown(notifier.dispose);
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: StatefulBuilder(
      builder: (context, setState) => TestUserHeaderRow(
        isWide: true,
        allSelected: false,
        anySelected: false,
        onToggleAll: (_) {},
        orders: notifier.state.orders,
        onSort: (field) => setState(() {
          notifier
              .setOrders({field: notifier.state.orders[field] == 1 ? -1 : 1});
        }),
      ),
    ))));
    await tester.tap(find.text('roles.name'));
    await tester.pump();
    expect(notifier.state.orders, {'roles.name': 1});
    expect(find.byIcon(Icons.arrow_upward), findsOneWidget);
    await tester.tap(find.text('roles.name'));
    await tester.pump();
    expect(notifier.state.orders, {'roles.name': -1});
    expect(find.byIcon(Icons.arrow_downward), findsOneWidget);
    await tester.tap(find.text('Name'));
    await tester.pump();
    expect(notifier.state.orders, {'name': 1});
  });

  for (final type in ['String', 'String?', 'List<String>', 'List<String>?']) {
    testWidgets('$type searches literal text, including array elements',
        (tester) async {
      dynamic value;
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: CustomSearchBar(
        fields: {'tags': type},
        filters: const {'tags': ''},
        onFilterChanged: (_, filter) => value = filter,
        onFilterRemove: (_, __) {},
      ))));
      await tester.pump();
      await tester.enterText(find.byType(TextFormField), 'seek.er+');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      expect(value, {r'$regex': r'seek\.er\+', r'$options': 'i'});
      await tester.enterText(find.byType(TextFormField), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      expect(value, '');
    });
  }

  for (final entry in {
    'int?': 12,
    'List<int>?': 12,
    'double?': 12.5,
    'bool?': true
  }.entries) {
    testWidgets('${entry.key} sends a typed filter', (tester) async {
      dynamic value;
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: CustomSearchBar(
        fields: {'field': entry.key},
        filters: const {'field': ''},
        onFilterChanged: (_, filter) => value = filter,
        onFilterRemove: (_, __) {},
      ))));
      await tester.pump();
      await tester.enterText(find.byType(TextFormField), '${entry.value}');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      expect(value, entry.value);
    });
  }

  testWidgets('escaped search text is restored', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: CustomSearchBar(
      fields: const {'roles.name': 'String?'},
      filters: const {
        'roles.name': {r'$regex': r'seek\.er\+', r'$options': 'i'}
      },
      onFilterChanged: (_, __) {},
      onFilterRemove: (_, __) {},
    ))));
    await tester.pump();
    expect(find.text('seek.er+'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
    await tester.pump();
    expect(tester.takeException(), isNull);
  });

  testWidgets('search rows survive parent filter updates and removal',
      (tester) async {
    var filters = <String, dynamic>{'roles.name': ''};
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: StatefulBuilder(
      builder: (context, setState) => CustomSearchBar(
        fields: const {'roles.name': 'String?', 'tags': 'List<String>?'},
        filters: filters,
        onFilterChanged: (field, value) => setState(() {
          filters = {...filters, field: value};
        }),
        onFilterRemove: (field, _) => setState(() {
          filters = {...filters}..remove(field);
        }),
      ),
    ))));
    await tester.enterText(find.byType(TextFormField), 'seeker');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('seeker'), findsOneWidget);
    expect(filters['roles.name'], {r'$regex': 'seeker', r'$options': 'i'});
    await tester.tap(find.byTooltip('Remove filter'));
    await tester.pumpAndSettle();
    expect(find.byType(TextFormField), findsNothing);
    expect(filters, isEmpty);
    expect(tester.takeException(), isNull);
  });

  test('HTTP requests carry sorting, stable ties, filters and page offsets',
      () async {
    final requests = <api.Request>[];
    generated.http = MockClient((request) async {
      requests.add(request);
      return api.Response(
          jsonEncode({
            'items': [
              {
                'id': '1',
                'name': 'A',
                'roles': [
                  {'name': 'seeker'}
                ]
              }
            ],
            'current_page':
                int.parse(request.url.queryParameters['skip']!) ~/ 2 + 1,
            'max_pages': 3,
          }),
          200);
    });
    addTearDown(generated.http.close);
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final subscription =
        container.listen(userPaginationProvider('test'), (_, __) {});
    addTearDown(subscription.close);
    final notifier = container.read(userPaginationProvider('test').notifier);
    notifier.setFilters({
      'roles.name': {r'$regex': 'seeker', r'$options': 'i'},
      'name': ''
    });
    notifier.setOrders({'roles.name': -1});
    Future<UserPaginationData> fetch() => container.read(
        getAllUserProvider(container.read(userPaginationProvider('test')))
            .future);
    await fetch();
    notifier.setPage(2);
    final data = await fetch();
    expect(data.currentPage, 2);
    expect(data.maxPages, 3);
    expect(data.items.single.roles.first['name'], 'seeker');
    expect(requests.map((r) => r.url.queryParameters['skip']), ['0', '2']);
    for (final request in requests) {
      final body = jsonDecode(request.body);
      expect(body['orders'], {'roles.name': -1, '_id': 1});
      expect(body['filters'], {
        'roles.name': {r'$regex': 'seeker', r'$options': 'i'}
      });
      expect(body['populate'], [
        {
          'id': 'roles',
          'from': 'Role',
          'fields': ['name', 'rank']
        }
      ]);
      expect(request.url.queryParameters['limit'], '2');
    }
    notifier.setOrders({'id': -1});
    await fetch();
    expect(jsonDecode(requests.last.body)['orders'], {'_id': -1});
    expect(requests.last.url.queryParameters['skip'], '0');
  });
}
