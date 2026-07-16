// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:laia_annotations/laia_annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:laia_widget_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

const _fieldChecker = TypeChecker.fromRuntime(Field);

class ListWidgetGenerator extends GeneratorForAnnotation<ListWidgetGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    print("GENERATING LIST WIDGET");
    final buffer = StringBuffer();
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    ClassElement classElement = element as ClassElement;

    final pageSize = annotation.read('pageSize').intValue;
    final List<String> defaultFields = annotation.read('defaultFields').listValue.map((element) => element.toStringValue() ?? '').toList();
    var widget = annotation.read('widget').stringValue;

    var className = visitor.className;
    var classNameLowercase = className.toLowerCase();
    var classNamePlural = '${classNameLowercase}s';

    if (widget == '') {
      widget = "${className}Widget";
    }

    // Avatar field (image on defaultFields)
    var avatarField = '';
    for (var field in classElement.fields) {
      if (_fieldChecker.hasAnnotationOfExact(field)) {
        avatarField = _fieldChecker
                .firstAnnotationOfExact(field)
                ?.getField('image')
                ?.toStringValue() ?? '';
      }
    }

    buffer.writeln('''
class ${className}ListView extends ConsumerStatefulWidget {
  final Map<String, dynamic>? extraFilters;
  final bool showAppBar;
  final Map<String, dynamic> currentFilters = {};
  late bool _initialized = false;
  late List<bool> selectedStates;

  ${className}ListView({Key? key, this.extraFilters, this.showAppBar = true}) : super(key: key);

  @override
  _${className}ListViewState createState() => _${className}ListViewState();
}

class _${className}ListViewState extends ConsumerState<${className}ListView> {
  final GlobalKey<CustomSearchBarState> _searchBarKey = GlobalKey<CustomSearchBarState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.extraFilters != null) {
        widget.extraFilters!.forEach((key, value) {
          widget.currentFilters[key] = value;
        });
      }
      ref.read(${classNameLowercase}PaginationProvider.notifier).setFilters(widget.extraFilters ?? {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    final paginationState = ref.watch(${classNameLowercase}PaginationProvider);

    final ${classNamePlural}AsyncValue =
        ref.watch(getAll${className}Provider(paginationState));

    final Map<String, int> columnSortStates = ref.watch(${classNameLowercase}PaginationProvider.notifier).getOrders();

    final Map<String, dynamic> fieldsFilterStates = ref.watch(${classNameLowercase}PaginationProvider.notifier).getFilters();

    void onSort(String columnName) {
      var state = columnSortStates[columnName];
      if (state == 0 || state == null) {
        columnSortStates[columnName] = 1;
      } else if (state == 1) {
        columnSortStates[columnName] = -1;
      } else if (state == -1) {
        columnSortStates.remove(columnName);
      }
      ref.read(${classNameLowercase}PaginationProvider.notifier).setOrders(columnSortStates);
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget.currentFilters[fieldName] = filterValue;
      ref.read(${classNameLowercase}PaginationProvider.notifier).setFilters(widget.currentFilters);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      if (widget.currentFilters.containsKey(fieldName)) {
        widget.currentFilters.remove(fieldName);
        ref.read(${classNameLowercase}PaginationProvider.notifier).setFilters(widget.currentFilters);
      }
    }''');

    final Set<String> generatedRelations = {};
    for (var field in classElement.fields) {
      String relation = '';
      relation = _fieldChecker
              .firstAnnotationOfExact(field)
              ?.getField('relation')
              ?.toStringValue() ?? relation;
      if (relation != '' && !generatedRelations.contains(relation)) {
        generatedRelations.add(relation);
        buffer.writeln('''Future<List<$relation>> fetch${relation}List(List<String>? ids) async {
          if (ids == null || ids.isEmpty) {
            return [];
          }
          final nonEmptyIds = ids.where((id) => id.isNotEmpty).toList();
          List<$relation> ${relation.toLowerCase()}List = await Future.wait(
            nonEmptyIds.map((id) async {
              return await ref.read(get${relation}Provider(id).future);
            }),
          );
          return ${relation.toLowerCase()}List;
        }''');
      }
    }

    buffer.writeln('''final bodyWidget = ${classNamePlural}AsyncValue.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Center(
          child: Text('You have no access to these records...'),
        ),
        data: (${className}PaginationData data) {
          final $classNamePlural = data.items;

          if (!widget._initialized) {
            widget.selectedStates = List.generate($classNamePlural.length, (index) => false);
            widget._initialized = true;
          }

          final allSelected = $classNamePlural.isNotEmpty && widget.selectedStates.every((e) => e);
          final anySelected = widget.selectedStates.any((e) => e);

          void toggleAll(bool value) {
            setState(() {
              widget.selectedStates = List.generate($classNamePlural.length, (_) => value);
            });
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.showAppBar) ...[
                  // --- Title ---
                  Center(
                    child: Text(
                      '$className List',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.indigo,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  // --- Top actions row: left filters, right add ---
                  Row(
                    children: [
                      PillButton(
                        icon: Icons.tune,
                        text: 'Add Filters',
                        onTap: () {
                          _searchBarKey.currentState?.addFilterRow();
                        },
                        bg: AppColors.lavender,
                      ),
                      const Spacer(),
                      PillButton(
                        text: 'Add $className',
                        trailing: Icons.add,
                        filled: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => ${className}Widget(isEditing: false),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                ],

                CustomSearchBar(
                  key: _searchBarKey,
                  showAddButton: false,
                  fields: const {''');

    bool isFirstField = true;

    for (var field in classElement.fields) {
      if (!isFirstField) {
        buffer.write(', ');
      } else {
        isFirstField = false;
      }

      buffer.write("'${field.name}': '${field.type.toString()}'");
    }

    buffer.writeln('''},
              filters: fieldsFilterStates,
              onFilterChanged: onFilter,
              onFilterRemove: onFilterRemove,
            ),
            const SizedBox(height: 18),
            _${className}HeaderRow(isWide: isWide),
            Container(height: 1, color: AppColors.outline),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: $classNamePlural.length,
                separatorBuilder: (_, __) =>
                    Container(height: 1, color: AppColors.outline.withOpacity(0.5)),
                itemBuilder: (context, index) {
                  final u = $classNamePlural[index];
                  return _${className}ListRow(
                    ''');
    // Here we add the fields to the row
    if (defaultFields.isEmpty) {
      for (var field in classElement.fields) {
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          buffer.writeln('    ${field.name}$className: u.${field.name},');
        }
      }
    } else {
      for (var defaultField in defaultFields) {
        print("defaultField: $defaultField");
        print("classElement.fields: ${classElement.fields.map((f) => f.name).toList()}");
        final baseFieldName = defaultField.split('.')[0];
        var fieldsList = classElement.fields.where((f) => f.name == baseFieldName);
        if (fieldsList.isEmpty) {
          print('Default field $defaultField not found in ${classElement.name}');
          continue;
        }
        var field = fieldsList.first;
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          buffer.writeln('    ${field.name}$className: u.${field.name},');
        }
      }
    }
    buffer.writeln('''
                    onMenuSelected: (value) async {
                      if (value == 'edit') {
                        _navigateElement(u);
                      } else if (value == 'delete') {
                        _onDeleteElement([u], ref, paginationState);
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 18),
          CustomPagination(
            currentPage: data.currentPage,
            maxPages: data.maxPages,
            onPageSelected: (pageNumber) => _onPageButtonPressed(
                pageNumber, ref, paginationState, data.maxPages),
          )
        ])
      );
      },
    );

    if (!widget.showAppBar) {
      return bodyWidget;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final hasNoResults = ${classNamePlural}AsyncValue.maybeWhen(
              error: (_, __) => true,
              orElse: () => false,
            );
            if (fieldsFilterStates.isNotEmpty && hasNoResults) {
              widget.currentFilters.clear();
              ref.read(${classNameLowercase}PaginationProvider.notifier).setFilters({});
            } else {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const Home(),
                ),
              );
            }
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: bodyWidget,
    );
  }

  void _onPageButtonPressed(int pageNumber, WidgetRef ref, ${className}PaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(${classNameLowercase}PaginationProvider.notifier).setPage(pageNumber);
    }
  }

  /// Normalises a [$className] that came from the list (which may have
  /// populated relation fields as Map / List<Map>) back to plain id Strings
  /// so the edit form can work with typed values.
  $className _normalizeForEdit($className $classNameLowercase) {
    String? _extractId(dynamic v) {
      if (v == null) return null;
      if (v is String) return v;
      if (v is Map) return v['id']?.toString() ?? v['_id']?.toString();
      try { return (v as dynamic).id?.toString(); } catch (_) {}
      return v.toString();
    }
    List<String>? _extractIds(dynamic v) {
      if (v == null) return null;
      if (v is List) {
        return v.map<String>((e) => _extractId(e) ?? '').toList();
      }
      final single = _extractId(v);
      return single != null ? [single] : null;
    }
    return $classNameLowercase.copyWith(
''');

    // For each relation field, emit the appropriate copyWith entry
    for (var field in classElement.fields) {
      if (!_fieldChecker.hasAnnotationOfExact(field)) continue;
      final relation =
          _fieldChecker
              .firstAnnotationOfExact(field)
              ?.getField('relation')
              ?.toStringValue() ??
          '';
      if (relation.isEmpty) continue;

      final fieldName = field.name;
      final fieldType = field.type.toString();
      final widgetValue = _fieldChecker
          .firstAnnotationOfExact(field)
          ?.getField('widget')
          ?.toStringValue() ?? '';
      // dynamic? fields go to MultiFieldWidget if isList is true (i.e. widget ends with MultiFieldWidget).
      final isSingleString = fieldType == 'String' || fieldType == 'String?' || 
          (relation.isNotEmpty && widgetValue.isNotEmpty && !widgetValue.endsWith('MultiFieldWidget'));

      if (isSingleString) {
        buffer.writeln(
          '      $fieldName: _extractId($classNameLowercase.$fieldName as dynamic),',
        );
      } else {
        buffer.writeln(
          '      $fieldName: _extractIds($classNameLowercase.$fieldName as dynamic),',
        );
      }
    }

    buffer.writeln('''
    );
  }

  void _navigateElement($className $classNameLowercase) {
    Navigator.push(
      context,
      PageRouteBuilder(pageBuilder: (_, __, ___) => ${className}Widget(
        element: _normalizeForEdit($classNameLowercase),
        isEditing: true)),
    );
  }

  void _onDeleteElement(List<$className> $classNamePlural, WidgetRef ref, ${className}PaginationState paginationState) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete these records?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteRecords($classNamePlural, ref, paginationState);
                Navigator.of(context).pop();
                setState(() {});
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteRecords(List<$className> $classNamePlural, WidgetRef ref, ${className}PaginationState paginationState) async {
    for (var $classNameLowercase in $classNamePlural) {
      await ref.read(delete${className}Provider($classNameLowercase.id!).future);
    }
    setState(() {
      widget._initialized = false;
    });
    ref.read(${classNameLowercase}PaginationProvider.notifier).setPage(1);
  }
}

class ${className}PaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;
  final Map<String, dynamic> filters;
  final List<dynamic> populate;

  ${className}PaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
    required this.populate,
  });
}

class ${className}PaginationNotifier extends StateNotifier<${className}PaginationState> {
  ${className}PaginationNotifier() : super(${className}PaginationState(
          pagination: const Tuple2<int, int>(0, $pageSize),
          orders: {},
          filters: {},
          populate: [
''');
    // Compute populate based on defaultFields and relations
    Map<String, Map<String, dynamic>> populateMap = {};
    if (defaultFields.isNotEmpty) {
      for (var defaultField in defaultFields) {
        final parts = defaultField.split('.');
        if (parts.length <= 1) continue;
        final baseFieldName = parts[0];
        var fieldsList = classElement.fields.where((f) => f.name == baseFieldName);
        if (fieldsList.isEmpty) continue;
        var field = fieldsList.first;
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          String relation = _fieldChecker
                  .firstAnnotationOfExact(field)
                  ?.getField('relation')
                  ?.toStringValue() ?? '';
          if (relation.isNotEmpty) {
            if (!populateMap.containsKey(baseFieldName)) {
              populateMap[baseFieldName] = {
                'from': relation,
                'fields': <String>[],
              };
            }
            final nestedField = parts[1];
            final list = populateMap[baseFieldName]!['fields'] as List<String>;
            if (!list.contains(nestedField)) {
              list.add(nestedField);
            }
          }
        }
      }
    } else {
      for (var field in classElement.fields) {
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          String relation = _fieldChecker
                  .firstAnnotationOfExact(field)
                  ?.getField('relation')
                  ?.toStringValue() ?? '';

          if (relation.isNotEmpty) {
            populateMap[field.name] = {
              'from': relation,
              'fields': <String>[],
            };
          }
        }
      }
    }
    for (var entry in populateMap.entries) {
      final base = entry.key;
      final from = entry.value['from'];
      final fields = entry.value['fields'] as List<String>;
      if (fields.isEmpty) {
        buffer.writeln("            {'id': '$base', 'from': '$from'},");
      } else {
        final fieldsStr = fields.map((f) => "'$f'").join(', ');
        buffer.writeln("            {'id': '$base', 'from': '$from', 'fields': [$fieldsStr]},");
      }
    }
    buffer.writeln('''          ],
        ));

  void setPage(int page) {
    state = ${className}PaginationState(
          pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2, state.pagination.item2),
          orders: state.orders,
          filters: state.filters,
          populate: state.populate,
        );
  }

  void setOrders(Map<String, int> newOrders) {
    state = ${className}PaginationState(
          pagination: Tuple2(state.pagination.item1, state.pagination.item2),
          orders: newOrders,
          filters: state.filters,
          populate: state.populate,
        );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = ${className}PaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: state.orders,
      filters: newFilters,
      populate: state.populate,
    );
  }

  Map<String, int> getOrders() {
    return state.orders;
  }

  Map<String, dynamic> getFilters() {
    return state.filters;
  }
}

final ${classNameLowercase}PaginationProvider =
    StateNotifierProvider<${className}PaginationNotifier, ${className}PaginationState>(
  (ref) => ${className}PaginationNotifier(),
);

class _${className}HeaderRow extends StatelessWidget {
  final bool isWide;

  const _${className}HeaderRow({required this.isWide});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleSmall?.copyWith(
          color: AppColors.indigo,
          fontWeight: FontWeight.w700,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          // left spacer (avatar column)
          const SizedBox(width: 56),
''');
    if (defaultFields.isEmpty) {
      for (var field in classElement.fields) {
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          String nameValue = _fieldChecker
                  .firstAnnotationOfExact(field)
                  ?.getField('fieldName')
                  ?.toStringValue() ?? '';

          var fieldName = field.name;
          if (nameValue.isNotEmpty) {
            fieldName = nameValue;
          }
          buffer.writeln('''
          Expanded(flex: 2, child: Text('$fieldName', style: style)),
          ''');
        }
      }
    } else {
      for (var defaultField in defaultFields) {
        final parts = defaultField.split('.');
        final baseFieldName = parts[0];
        var fieldsList = classElement.fields.where((f) => f.name == baseFieldName);
        if (fieldsList.isEmpty) {
          print('Default field $defaultField not found in ${classElement.name}');
          continue;
        }
        var field = fieldsList.first;
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          String nameValue = _fieldChecker
                  .firstAnnotationOfExact(field)
                  ?.getField('fieldName')
                  ?.toStringValue() ?? '';

          var fieldName = field.name;
          if (nameValue.isNotEmpty) {
            fieldName = nameValue;
          }
          if (parts.length > 1) {
            fieldName = "${field.name}.${parts[1]}";
          }
          buffer.writeln('''
          Expanded(flex: 2, child: Text('$fieldName', style: style)),
          ''');
        }
      }
    }
    buffer.writeln('''

          const SizedBox(width: 36), // menu
        ],
      ),
    );
  }
}

class _${className}ListRow extends ConsumerWidget {
''');
    // Here we add the fields to the constructor
    if (defaultFields.isEmpty) {
      for (var field in classElement.fields) {
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          buffer.writeln('  final ${field.type} ${field.name}$className;');
        }
      }
    } else {
      Set<String> addedFields = {};
      for (var defaultField in defaultFields) {
        final baseFieldName = defaultField.split('.')[0];
        if (addedFields.contains(baseFieldName)) continue;

        var fieldsList = classElement.fields.where((f) => f.name == baseFieldName);
        if (fieldsList.isEmpty) {
          print('Default field $defaultField not found in ${classElement.name}');
          continue;
        }
        var field = fieldsList.first;
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          buffer.writeln('  final ${field.type} ${field.name}$className;');
          addedFields.add(baseFieldName);
        }
      }
    }

    buffer.writeln('''
  final ValueChanged<String> onMenuSelected;

  const _${className}ListRow({
''');
    // Here we add the fields to the constructor
    if (defaultFields.isEmpty) {
      for (var field in classElement.fields) {
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          buffer.writeln('    required this.${field.name}$className,');
        }
      }
    } else {
      Set<String> addedFields = {};
      for (var defaultField in defaultFields) {
        final baseFieldName = defaultField.split('.')[0];
        if (addedFields.contains(baseFieldName)) continue;

        var fieldsList = classElement.fields.where((f) => f.name == baseFieldName);
        if (fieldsList.isEmpty) {
          print('Default field $defaultField not found in ${classElement.name}');
          continue;
        }
        var field = fieldsList.first;
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          buffer.writeln('    required this.${field.name}$className,');
          addedFields.add(baseFieldName);
        }
      }
    }
    buffer.writeln('''
    required this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppColors.muted, // gris texto como en la captura
          fontWeight: FontWeight.w500,
        );

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            const SizedBox(width: 56),

''');    // Here we add the fields to the row
    if (defaultFields.isEmpty) {
      for (var field in classElement.fields) {
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          final isEnum = field.type.element is EnumElement;
          final isRelation = (_fieldChecker.firstAnnotationOfExact(field)?.getField('relation')?.toStringValue() ?? '').isNotEmpty;
          String fieldText = '';
          if (isRelation) {
            fieldText = '''
              (() {
                final dynamic val = ${field.name}$className;
                if (val == null) return '';
                if (val is Map) return val['id']?.toString() ?? val['_id']?.toString() ?? val.toString();
                try {
                  final id = (val as dynamic).id?.toString();
                  if (id != null) return id;
                } catch (_) {}
                if (val is List) {
                  return val.map((e) {
                    final dynamic elem = e;
                    if (elem is Map) return elem['id']?.toString() ?? elem['_id']?.toString() ?? elem.toString();
                    try {
                      final id = (elem as dynamic).id?.toString();
                      if (id != null) return id;
                    } catch (_) {}
                    return elem.toString();
                  }).join(', ');
                }
                return val.toString();
              })()
              ''';
          } else {
            fieldText = isEnum
                ? '${field.name}$className?.name ?? \'\''
                : '${field.name}$className.toString()';
          }
          buffer.writeln('''
            Expanded(
              flex: 2,
              child: Text($fieldText, style: textStyle),
            ),
          ''');
        }
      }
    } else {
      for (var defaultField in defaultFields) {
        final parts = defaultField.split('.');
        final baseFieldName = parts[0];

        var fieldsList = classElement.fields.where((f) => f.name == baseFieldName);
        if (fieldsList.isEmpty) continue;
        var field = fieldsList.first;

        if (_fieldChecker.hasAnnotationOfExact(field)) {
          final isEnum = field.type.element is EnumElement;
          final relation =
              _fieldChecker
                  .firstAnnotationOfExact(field)
                  ?.getField('relation')
                  ?.toStringValue() ??
              '';
          final isRelation = relation.isNotEmpty;
          String cellChild = '';
          if (parts.length > 1 && isRelation) {
            final nestedField = parts[1];
            cellChild =
                '''
              (() {
                final dynamic val = ${field.name}$className;
                if (val == null) return const SizedBox.shrink();
                if (val is List) {
                  if (val.isEmpty) return const SizedBox.shrink();
                  final firstElem = val.first;
                  if (firstElem is Map) {
                    final titles = val.map((e) => (e as Map)['$nestedField']?.toString() ?? '').where((t) => t.isNotEmpty).join(', ');
                    return Text(titles, style: textStyle);
                  }
                  return Text(val.join(', '), style: textStyle);
                }
                if (val is Map) {
                  return Text(val['$nestedField']?.toString() ?? '', style: textStyle);
                }
                return Text(val.toString(), style: textStyle);
              })()
              ''';
          } else {
            String fieldText = '';
            if (parts.length > 1) {
              final nestedField = parts[1];
              fieldText =
                  '''
                  (() {
                    final dynamic val = ${field.name}$className;
                    if (val == null) return '';
                    if (val is List) {
                      return val.map((e) {
                        if (e is Map) return e['$nestedField']?.toString() ?? '';
                        try {
                          return (e as dynamic).$nestedField?.toString() ?? '';
                        } catch (_) {
                          return e.toString();
                        }
                      }).join(', ');
                    }
                    if (val is Map) return val['$nestedField']?.toString() ?? '';
                    try {
                      return (val as dynamic).$nestedField?.toString() ?? '';
                    } catch (_) {
                      return val.toString();
                    }
                  })()
                  ''';
            } else {
              if (isRelation) {
                fieldText = '''
                      (() {
                        final dynamic val = ${field.name}$className;
                        if (val == null) return '';
                        if (val is String) return val;
                        if (val is List) {
                          if (val.isEmpty) return '';
                          if (val.first is String) return val.join(', ');
                        }
                        if (val is Map) return val['id']?.toString() ?? val['_id']?.toString() ?? val.toString();
                        try {
                          final id = (val as dynamic).id?.toString();
                          if (id != null) return id;
                        } catch (_) {}
                        if (val is List) {
                          return val.map((e) {
                            final dynamic elem = e;
                            if (elem is String) return elem;
                            if (elem is Map) return elem['id']?.toString() ?? elem['_id']?.toString() ?? elem.toString();
                            try {
                              final id = (elem as dynamic).id?.toString();
                              if (id != null) return id;
                            } catch (_) {}
                            return elem.toString();
                          }).join(', ');
                        }
                        return val.toString();
                      })()
                      ''';
              } else {
                fieldText = isEnum
                    ? '${field.name}$className?.name ?? \'\''
                    : '${field.name}$className.toString()';
              }
            }
            cellChild = 'Text($fieldText, style: textStyle)';
          }

          buffer.writeln('''
            Expanded(
              flex: 2,
              child: $cellChild,
            ),
          ''');
        }
      }
    }
    buffer.writeln('''

            // 3 dots menu
            SizedBox(
              width: 36,
              child: Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert, color: AppColors.muted),
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  onSelected: onMenuSelected,
                  itemBuilder: (_) => const [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

''');

    return buffer.toString();
  }
}