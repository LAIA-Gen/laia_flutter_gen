// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:laia_annotations/laia_annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:laia_widget_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

const _fieldChecker = TypeChecker.fromRuntime(Field);

String _searchType(ClassElement model, String path) {
  FieldElement? field;
  ClassElement? current = model;
  for (final part in path.split('.')) {
    field = current?.getField(part);
    if (field == null) return 'String';
    DartType type = field.type;
    if (type is InterfaceType && type.isDartCoreList) {
      type = type.typeArguments.first;
    }
    final relation = _fieldChecker.firstAnnotationOfExact(field)
        ?.getField('relation')?.toStringValue() ?? '';
    if (relation.isNotEmpty) {
      current = null;
      for (final library in [model.library, ...model.library.importedLibraries]) {
        current = library.getClass(relation);
        if (current != null) break;
      }
    } else {
      current = type.element is ClassElement ? type.element as ClassElement : null;
    }
  }
  return field?.type.toString() ?? 'String';
}

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
  String get _providerKey => widget.key?.toString() ?? widget.extraFilters?.toString() ?? 'default';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (widget.extraFilters != null) {
        widget.extraFilters!.forEach((key, value) {
          widget.currentFilters[key] = value;
        });
      }
      ref.read(${classNameLowercase}PaginationProvider(_providerKey).notifier).setFilters(widget.extraFilters ?? {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    final paginationState = ref.watch(${classNameLowercase}PaginationProvider(_providerKey));

    final ${classNamePlural}AsyncValue =
        ref.watch(getAll${className}Provider(paginationState));

    final Map<String, int> columnSortStates = paginationState.orders;

    final Map<String, dynamic> fieldsFilterStates = ref.watch(${classNameLowercase}PaginationProvider(_providerKey).notifier).getFilters();

    void onSort(String columnName) {
      widget._initialized = false;
      ref.read(${classNameLowercase}PaginationProvider(_providerKey).notifier)
          .setOrders({columnName: columnSortStates[columnName] == 1 ? -1 : 1});
    }

    void onFilter(String fieldName, dynamic filterValue) {
      widget._initialized = false;
      widget.currentFilters[fieldName] = filterValue;
      ref.read(${classNameLowercase}PaginationProvider(_providerKey).notifier).setFilters(widget.currentFilters);
    }

    void onFilterRemove(String fieldName, dynamic filterValue) {
      widget._initialized = false;
      if (widget.currentFilters.containsKey(fieldName)) {
        widget.currentFilters.remove(fieldName);
        ref.read(${classNameLowercase}PaginationProvider(_providerKey).notifier).setFilters(widget.currentFilters);
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

          if (!widget._initialized || widget.selectedStates.length != $classNamePlural.length) {
            widget.selectedStates = List.generate($classNamePlural.length, (index) => false);
            widget._initialized = true;
          }

          final allSelected = $classNamePlural.isNotEmpty && widget.selectedStates.every((e) => e);
          final anySelected = widget.selectedStates.any((e) => e);
          final selectedCount = widget.selectedStates.where((e) => e).length;

          void toggleAll(bool value) {
            setState(() {
              widget.selectedStates = List.generate($classNamePlural.length, (_) => value);
            });
          }

          void toggleOne(int index, bool value) {
            setState(() {
              widget.selectedStates[index] = value;
            });
          }

          void bulkDelete() {
            final selected = <$className>[];
            for (var i = 0; i < $classNamePlural.length; i++) {
              if (widget.selectedStates[i]) {
                selected.add($classNamePlural[i]);
              }
            }
            if (selected.isNotEmpty) {
              _onDeleteElement(selected, ref, paginationState);
            }
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
                      const SizedBox(width: 12),
                      if (anySelected)
                        PillButton(
                          icon: Icons.delete_outline,
                          text: 'Delete \$selectedCount',
                          onTap: bulkDelete,
                          bg: Colors.red.shade50,
                          fg: Colors.red.shade700,
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
                  fields: {''');

    bool isFirstField = true;

    for (var field in classElement.fields) {
      if (!isFirstField) {
        buffer.write(', ');
      } else {
        isFirstField = false;
      }

      // Search the displayed values of populated arrays, rather than their IDs.
      final nestedFields = defaultFields
          .where((path) => path.startsWith('${field.name}.'))
          .toList();
      if (nestedFields.isEmpty) {
        buffer.write("'${field.name}': '${field.type.toString()}'");
      } else {
        // Preserve existing ID constraints (for example a relation tab's
        // extraFilters), while offering displayed paths for new searches.
        buffer.write("if (fieldsFilterStates.containsKey('${field.name}')) '${field.name}': '${field.type}', ");
        buffer.write(nestedFields.map((path) => "'$path': '${_searchType(classElement, path)}'").join(', '));
      }
    }

    buffer.writeln('''},
              filters: fieldsFilterStates,
              onFilterChanged: onFilter,
              onFilterRemove: onFilterRemove,
            ),
            const SizedBox(height: 18),
            _${className}HeaderRow(isWide: isWide, allSelected: allSelected, anySelected: anySelected, onToggleAll: toggleAll, orders: columnSortStates, onSort: onSort),
            Container(height: 1, color: AppColors.outline),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: $classNamePlural.length,
                separatorBuilder: (_, __) =>
                    Container(height: 1, color: AppColors.outline.withOpacity(0.5)),
                itemBuilder: (context, index) {
                  final u = $classNamePlural[index];
                  final isSelected = widget.selectedStates.length > index ? widget.selectedStates[index] : false;
                  return _${className}ListRow(
                    isSelected: isSelected,
                    onSelected: (val) => toggleOne(index, val),
                    ''');
    // Here we add the fields to the row
    if (defaultFields.isEmpty) {
      for (var field in classElement.fields) {
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          buffer.writeln('    ${field.name}$className: u.${field.name},');
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
          buffer.writeln('    ${field.name}$className: u.${field.name},');
          addedFields.add(baseFieldName);
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
              ref.read(${classNameLowercase}PaginationProvider(_providerKey).notifier).setFilters({});
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
    if (pageNumber >= 1 && pageNumber <= maxPages) {
      widget._initialized = false;
      ref.read(${classNameLowercase}PaginationProvider(_providerKey).notifier).setPage(pageNumber);
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
    ref.read(${classNameLowercase}PaginationProvider(_providerKey).notifier).setPage(1);
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

    void addPopulateLevel({
      required String populateId,
      required String fromCollection,
      String? childField,
    }) {
      if (!populateMap.containsKey(populateId)) {
        populateMap[populateId] = {
          'from': fromCollection,
          'fields': <String>[],
          'allFields': childField == null,
        };
      }
      if (childField != null) {
        final list = populateMap[populateId]!['fields'] as List<String>;
        if (!list.contains(childField)) {
          list.add(childField);
        }
      } else {
        populateMap[populateId]!['allFields'] = true;
      }
    }

    if (defaultFields.isNotEmpty) {
      for (var defaultField in defaultFields) {
        final parts = defaultField.split('.');
        final baseFieldName = parts[0];

        var fieldsList = classElement.fields.where((f) => f.name == baseFieldName);
        if (fieldsList.isEmpty) continue;
        var field = fieldsList.first;
        if (!_fieldChecker.hasAnnotationOfExact(field)) continue;

        String rootRelation = _fieldChecker
                .firstAnnotationOfExact(field)
                ?.getField('relation')
                ?.toStringValue() ?? '';
        if (rootRelation.isEmpty) continue;

        if (parts.length == 1) {
          addPopulateLevel(
            populateId: baseFieldName,
            fromCollection: rootRelation,
            childField: null,
          );
        } else {
          for (int i = 0; i < parts.length - 1; i++) {
            final populateId = parts.sublist(0, i + 1).join('.');
            String fromCol;
            if (i == 0) {
              fromCol = rootRelation;
            } else {
              final segment = parts[i];
              fromCol = segment.endsWith('Id')
                  ? segment.substring(0, segment.length - 2).toLowerCase()
                  : segment.toLowerCase();
            }
            final childField = parts[i + 1];
            addPopulateLevel(
              populateId: populateId,
              fromCollection: fromCol,
              childField: childField,
            );
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
              'allFields': true,
            };
          }
        }
      }
    }
    for (var entry in populateMap.entries) {
      final base = entry.key;
      final from = entry.value['from'];
      final fields = entry.value['fields'] as List<String>;
      final bool allFields = entry.value['allFields'] ?? false;
      if (allFields || fields.isEmpty) {
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
          pagination: Tuple2(0, state.pagination.item2),
          orders: Map<String, int>.unmodifiable(newOrders),
          filters: state.filters,
          populate: state.populate,
        );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = ${className}PaginationState(
      pagination: Tuple2(0, state.pagination.item2),
      orders: state.orders,
      filters: Map<String, dynamic>.unmodifiable(newFilters),
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
    StateNotifierProvider.autoDispose.family<${className}PaginationNotifier, ${className}PaginationState, String>(
  (ref, key) => ${className}PaginationNotifier(),
);

class _${className}HeaderRow extends StatelessWidget {
  final bool isWide;
  final bool allSelected;
  final bool anySelected;
  final ValueChanged<bool> onToggleAll;
  final Map<String, int> orders;
  final ValueChanged<String> onSort;

  const _${className}HeaderRow({required this.isWide, required this.allSelected, required this.anySelected, required this.onToggleAll, required this.orders, required this.onSort});

  Widget _sortHeader(String field, String label, TextStyle? style) {
    final direction = orders[field];
    return Expanded(
      flex: 2,
      child: TextButton(
        onPressed: () => onSort(field),
        style: TextButton.styleFrom(alignment: Alignment.centerLeft),
        child: Row(children: [
          Flexible(child: Text(label, style: style)),
          const SizedBox(width: 4),
          Icon(direction == null ? Icons.unfold_more :
              direction == 1 ? Icons.arrow_upward : Icons.arrow_downward,
              size: 16, semanticLabel: direction == null ? 'Sort' :
                  direction == 1 ? 'Ascending' : 'Descending'),
        ]),
      ),
    );
  }

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
          // select-all checkbox
          SizedBox(
            width: 48,
            child: Checkbox(
              value: allSelected,
              tristate: true,
              onChanged: (val) => onToggleAll(!(allSelected)),
              activeColor: AppColors.indigo,
            ),
          ),
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
          _sortHeader('${field.name}', '$fieldName', style),
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
            fieldName = "${field.name}.${parts.sublist(1).join('.')}";
          }
          buffer.writeln('''
          _sortHeader('$defaultField', '$fieldName', style),
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
  final bool isSelected;
  final ValueChanged<bool> onSelected;
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
    required this.isSelected,
    required this.onSelected,
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
            SizedBox(
              width: 48,
              child: Checkbox(
                value: isSelected,
                onChanged: (val) => onSelected(val ?? false),
                activeColor: AppColors.indigo,
              ),
            ),
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
                if (val == null) return '-';
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
            final fieldTypeStr = field.type.toString();
            final isDateTime = fieldTypeStr == 'DateTime' || fieldTypeStr == 'DateTime?';
            final format = _fieldChecker.hasAnnotationOfExact(field)
                ? _fieldChecker.firstAnnotationOfExact(field)?.getField('format')?.toStringValue() ?? ''
                : '';
            final access = '${field.name}$className';

            if (isDateTime) {
              if (format == 'yyyy-MM-dd' || format == 'date') {
                fieldText = '''
                  (() {
                    final val = $access;
                    if (val == null) return '-';
                    return '\${val.year}-\${val.month.toString().padLeft(2, '0')}-\${val.day.toString().padLeft(2, '0')}';
                  })()
                ''';
              } else if (format == 'yyyy-MM-dd HH:mm') {
                fieldText = '''
                  (() {
                    final val = $access;
                    if (val == null) return '-';
                    return '\${val.year}-\${val.month.toString().padLeft(2, '0')}-\${val.day.toString().padLeft(2, '0')} \${val.hour.toString().padLeft(2, '0')}:\${val.minute.toString().padLeft(2, '0')}';
                  })()
                ''';
              } else {
                fieldText = '$access?.toString() ?? \'-\'';
              }
            } else if (isEnum) {
              fieldText = '$access?.name ?? \'-\'';
            } else {
              fieldText = '$access?.toString() ?? \'-\'';
            }
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

          if (parts.length > 1) {
            final pathList = parts.sublist(1).map((p) => "'$p'").join(', ');
            cellChild = '''
              (() {
                dynamic extractNested(dynamic data, List<String> path) {
                  dynamic current = data;
                  for (int i = 0; i < path.length; i++) {
                    final key = path[i];
                    if (current == null) return null;
                    if (current is Map) {
                      current = current[key];
                    } else if (current is List) {
                      final subPath = path.sublist(i);
                      final items = current
                          .map((e) => extractNested(e, subPath))
                          .where((e) => e != null && e.toString().isNotEmpty)
                          .toList();
                      return items.isEmpty ? null : items.join(', ');
                    } else {
                      try {
                        current = (current as dynamic)[key];
                      } catch (_) {
                        return null;
                      }
                    }
                  }
                  return current;
                }

                final dynamic val = ${field.name}$className;
                if (val == null) return Text('-', style: textStyle);
                final res = extractNested(val, [$pathList]);
                if (res == null || res.toString() == 'null' || res.toString().isEmpty) return Text('-', style: textStyle);
                return Text(res.toString(), style: textStyle);
              })()
            ''';
          } else if (isRelation) {
            cellChild = '''
              (() {
                final dynamic val = ${field.name}$className;
                if (val == null) return Text('-', style: textStyle);
                if (val is String) return Text(val, style: textStyle);
                if (val is List) {
                  if (val.isEmpty) return Text('-', style: textStyle);
                  if (val.first is String) return Text(val.join(', '), style: textStyle);
                }
                if (val is Map) {
                  final str = val['id']?.toString() ?? val['_id']?.toString() ?? val.toString();
                  return Text(str, style: textStyle);
                }
                try {
                  final id = (val as dynamic).id?.toString();
                  if (id != null) return Text(id, style: textStyle);
                } catch (_) {}
                if (val is List) {
                  final str = val.map((e) {
                    final dynamic elem = e;
                    if (elem is String) return elem;
                    if (elem is Map) return elem['id']?.toString() ?? elem['_id']?.toString() ?? elem.toString();
                    try {
                      final id = (elem as dynamic).id?.toString();
                      if (id != null) return id;
                    } catch (_) {}
                    return elem.toString();
                  }).join(', ');
                  return Text(str, style: textStyle);
                }
                return Text(val.toString(), style: textStyle);
              })()
            ''';
          } else {
            final fieldTypeStr = field.type.toString();
            final isDateTime = fieldTypeStr == 'DateTime' || fieldTypeStr == 'DateTime?';
            final format = _fieldChecker.hasAnnotationOfExact(field)
                ? _fieldChecker.firstAnnotationOfExact(field)?.getField('format')?.toStringValue() ?? ''
                : '';
            final access = '${field.name}$className';

            if (isDateTime) {
              if (format == 'yyyy-MM-dd' || format == 'date') {
                cellChild = '''Text(($access == null) ? '-' : '\${$access!.year}-\${$access!.month.toString().padLeft(2, '0')}-\${$access!.day.toString().padLeft(2, '0')}', style: textStyle)''';
              } else if (format == 'yyyy-MM-dd HH:mm') {
                cellChild = '''Text(($access == null) ? '-' : '\${$access!.year}-\${$access!.month.toString().padLeft(2, '0')}-\${$access!.day.toString().padLeft(2, '0')} \${$access!.hour.toString().padLeft(2, '0')}:\${$access!.minute.toString().padLeft(2, '0')}', style: textStyle)''';
              } else {
                cellChild = '''Text($access?.toString() ?? '-', style: textStyle)''';
              }
            } else if (isEnum) {
              cellChild = '''Text($access?.name ?? '-', style: textStyle)''';
            } else {
              cellChild = '''Text($access?.toString() ?? '-', style: textStyle)''';
            }
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
