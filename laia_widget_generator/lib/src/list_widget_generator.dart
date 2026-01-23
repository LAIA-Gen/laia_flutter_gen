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
  final Map<String, dynamic> currentFilters = {};
  late bool _initialized = false;
  late List<bool> selectedStates;

  ${className}ListView({Key? key, this.extraFilters}) : super(key: key);

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
      ref.read(${classNameLowercase}PaginationProvider.notifier).setFilters(widget.extraFilters!);
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
      }
    }''');

    for (var field in classElement.fields) {
      String relation = '';
      relation = _fieldChecker
              .firstAnnotationOfExact(field)
              ?.getField('relation')
              ?.toStringValue() ?? relation;
      if (relation != '') {
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

    buffer.writeln('''return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => Home(),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ${classNamePlural}AsyncValue.when(
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
        var field = classElement.fields.firstWhere((f) => f.name == defaultField);
        if (field == null) {
          print('Default field $defaultField not found in ${classElement.name}');
          continue;
        }
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
    ));
  }

  void _onPageButtonPressed(int pageNumber, WidgetRef ref, ${className}PaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(${classNameLowercase}PaginationProvider.notifier).setPage(pageNumber);
    }
  }

  void _navigateElement($className $classNameLowercase) {
    Navigator.push(
      context,
      PageRouteBuilder(pageBuilder: (_, __, ___) => ${className}Widget(
        element: $classNameLowercase,
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

  ${className}PaginationState({
    required this.pagination,
    required this.orders,
    required this.filters,
  });
}

class ${className}PaginationNotifier extends StateNotifier<${className}PaginationState> {
  ${className}PaginationNotifier() : super(${className}PaginationState(
          pagination: const Tuple2<int, int>(0, $pageSize),
          orders: {},
          filters: {},
        ));

  void setPage(int page) {
    state = ${className}PaginationState(
          pagination: Tuple2(page * state.pagination.item2 - state.pagination.item2, state.pagination.item2),
          orders: state.orders,
          filters: state.filters,
        );
  }

  void setOrders(Map<String, int> newOrders) {
    state = ${className}PaginationState(
          pagination: Tuple2(state.pagination.item1, state.pagination.item2),
          orders: newOrders,
          filters: state.filters,
        );
  }

  void setFilters(Map<String, dynamic> newFilters) {
    state = ${className}PaginationState(
      pagination: Tuple2(state.pagination.item1, state.pagination.item2),
      orders: state.orders,
      filters: newFilters,
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
        var field = classElement.fields.firstWhere((f) => f.name == defaultField);
        if (field == null) {
          print('Default field $defaultField not found in ${classElement.name}');
          continue;
        }
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
  }
    buffer.writeln('''

          const SizedBox(width: 36), // menu
        ],
      ),
    );
  }
}

class _${className}ListRow extends StatelessWidget {
''');
    // Here we add the fields to the constructor
    if (defaultFields.isEmpty) {
      for (var field in classElement.fields) {
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          buffer.writeln('  final ${field.type} ${field.name}$className;');
        }
      }
  } else {
      for (var defaultField in defaultFields) {
        var field = classElement.fields.firstWhere((f) => f.name == defaultField);
        if (field == null) {
          print('Default field $defaultField not found in ${classElement.name}');
          continue;
        }
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          buffer.writeln('  final ${field.type} ${field.name}$className;');
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
      for (var defaultField in defaultFields) {
        var field = classElement.fields.firstWhere((f) => f.name == defaultField);
        if (field == null) {
          print('Default field $defaultField not found in ${classElement.name}');
          continue;
        }
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          buffer.writeln('    required this.${field.name}$className,');
        }
      }
  }
    buffer.writeln('''
    required this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
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
          buffer.writeln('''
            Expanded(
              flex: 2,
              child: Text(${field.name}$className.toString(), style: textStyle),
            ),
          ''');
        }
      }
  } else {
      for (var defaultField in defaultFields) {
        var field = classElement.fields.firstWhere((f) => f.name == defaultField);
        if (field == null) {
          print('Default field $defaultField not found in ${classElement.name}');
          continue;
        }
        if (_fieldChecker.hasAnnotationOfExact(field)) {
          buffer.writeln('''
            Expanded(
              flex: 2,
              child: Text(${field.name}$className.toString(), style: textStyle),
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