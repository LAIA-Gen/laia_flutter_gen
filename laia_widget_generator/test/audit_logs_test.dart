import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'generated/auditlog_widgets.dart';

void main() {
  final record = {
    'id': 'log-1',
    'createdAt': '2026-09-28T12:00:00Z',
    'action': 'UPDATE',
    'model': 'Match',
    'resource_id': 'match-1',
    'user': {'id': 'user-1'},
    'result': {'success': true, 'status_code': 200},
    'changes': {
      'before': {'status': 'pending'},
      'after': {'status': 'accepted'}
    },
    'request': {
      'method': 'PUT',
      'payload': {'status': 'accepted'}
    }
  };

  testWidgets('server pagination, sorting, filters and read-only details',
      (tester) async {
    final requests = <http.Request>[];
    final api = AuditApi('http://test', MockClient((request) async {
      requests.add(request);
      return http.Response(
          jsonEncode({
            'items': [record],
            'max_pages': 3
          }),
          200);
    }), () async => {'Authorization': 'Bearer test-token'});
    await tester.pumpWidget(
        MaterialApp(home: AuditLogPage(api: api, model: 'AuditLog')));
    await tester.pumpAndSettle();
    expect(requests.last.headers['Authorization'], 'Bearer test-token');
    expect(
        jsonDecode(requests.last.body)['orders'], {'createdAt': -1, '_id': 1});
    await tester.tap(find.byTooltip('Siguiente'));
    await tester.pumpAndSettle();
    expect(requests.last.url.queryParameters['skip'], '20');
    await tester.tap(find.text('Fecha'));
    await tester.pumpAndSettle();
    expect(requests.last.url.queryParameters['skip'], '0');
    expect(jsonDecode(requests.last.body)['orders']['createdAt'], 1);
    await tester.enterText(find.byType(TextField), 'UPDATE');
    await tester.tap(find.text('Filtrar'));
    await tester.pumpAndSettle();
    expect(jsonDecode(requests.last.body)['filters'], {'action': 'UPDATE'});
    await tester.tap(find.text('UPDATE').last);
    await tester.pumpAndSettle();
    expect(find.text('AuditLog · Detalle'), findsOneWidget);
    expect(find.text('Solo lectura'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('changes'), 250,
        scrollable: find
            .descendant(
                of: find.byType(ListView), matching: find.byType(Scrollable))
            .first);
    expect(
        find.byWidgetPredicate(
            (w) => w is SelectableText && (w.data ?? '').contains('pending')),
        findsOneWidget);
    expect(find.byIcon(Icons.delete), findsNothing);
    expect(find.byIcon(Icons.edit), findsNothing);
    expect(
        requests
            .every((r) => r.method == 'POST' && r.url.path == '/auditlogs/'),
        isTrue);
  });

  testWidgets('unauthorized users see no audit menu and cannot view logs',
      (tester) async {
    final api = AuditApi(
        'http://test',
        MockClient((_) async => http.Response('{}', 403)),
        () async => {'Authorization': 'Bearer limited'});
    await tester
        .pumpWidget(MaterialApp(home: Scaffold(body: AuditMenu(api: api))));
    await tester.pumpAndSettle();
    expect(find.text('AuditLog'), findsNothing);
    expect(find.text('LoginEvent'), findsNothing);
    await tester.pumpWidget(
        MaterialApp(home: AuditLogPage(api: api, model: 'LoginEvent')));
    await tester.pumpAndSettle();
    expect(find.textContaining('Solo los administradores'), findsOneWidget);
  });

  testWidgets(
      'administrator can navigate to login events; empty state is correct',
      (tester) async {
    final paths = <String>[];
    final api = AuditApi('http://test', MockClient((r) async {
      paths.add(r.url.path);
      return http.Response('{"items":[],"max_pages":0}', 200);
    }), () async => {'Authorization': 'Bearer admin'});
    await tester
        .pumpWidget(MaterialApp(home: Scaffold(body: AuditMenu(api: api))));
    await tester.pumpAndSettle();
    await tester.tap(find.text('LoginEvent'));
    await tester.pumpAndSettle();
    expect(paths.last, '/loginevents/');
    expect(find.text('No hay registros para estos filtros.'), findsOneWidget);
    expect(
        tester
            .widget<IconButton>(
                find.widgetWithIcon(IconButton, Icons.chevron_right))
            .onPressed,
        isNull);
  });

  testWidgets('request failure can be retried', (tester) async {
    var calls = 0;
    final api = AuditApi('http://test', MockClient((_) async {
      calls++;
      return calls == 1
          ? http.Response('{}', 503)
          : http.Response('{"items":[],"max_pages":0}', 200);
    }), () async => {'Authorization': 'Bearer admin'});
    await tester.pumpWidget(
        MaterialApp(home: AuditLogPage(api: api, model: 'AuditLog')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Reintentar'));
    await tester.pumpAndSettle();
    expect(find.text('0 registros'), findsOneWidget);
  });
}
