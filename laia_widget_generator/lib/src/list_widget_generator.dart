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
        title: const Text('$className List'),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ${className}Widget(
                      isEditing: false,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Styles.buttonPrimaryColor),
                elevation:
                    MaterialStateProperty.resolveWith<double>((states) {
                  if (states.contains(MaterialState.hovered) ||
                      states.contains(MaterialState.pressed)) {
                    return 0;
                  }
                  return 0;
                }),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                overlayColor:
                    MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Styles.buttonPrimaryColorHover;
                  }
                  return Colors.transparent;
                }),
              ),
              child: const Text('Create $className'),
            ),),
          ],
        ),
      body: ${classNamePlural}AsyncValue.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: \$error'),
        data: (${className}PaginationData data) {
          final $classNamePlural = data.items;

          if (!widget._initialized) {
            widget.selectedStates = List.generate($classNamePlural.length, (index) => false);
            widget._initialized = true;
          }

          return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomSearchBar(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.grey),
                  onPressed: () {
                    ref.read(${classNameLowercase}PaginationProvider.notifier).setPage(1);
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                  child: ElevatedButton(
                  onPressed: widget.selectedStates.contains(true)
                    ? () {
                        List<int> selectedIndices = List.generate(
                          widget.selectedStates.length,
                          (index) => widget.selectedStates[index] ? index : -1,
                        ).where((index) => index != -1).toList();

                        List<$className> selected${className}s = selectedIndices.map((index) => $classNamePlural[index]).toList();
                        _onDeleteElement(selected${className}s, ref, paginationState);
                      }
                    : null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      widget.selectedStates.contains(true)
                        ?
                        const Color.fromARGB(255, 224, 210, 210): 
                        const Color.fromARGB(255, 202, 202, 202)),
                    elevation:
                        MaterialStateProperty.resolveWith<double>((states) {
                      if (states.contains(MaterialState.hovered) ||
                          states.contains(MaterialState.pressed)) {
                        return 0;
                      }
                      return 0;
                    }),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    overlayColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return const Color.fromARGB(255, 194, 165, 165);
                      }
                      return Colors.transparent;
                    }),
                  ),
                  child: const Text('Delete'),
                ),
              ),]
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                          width: MediaQuery.of(context).size.width > 1500 ? MediaQuery.of(context).size.width : 1500,
                          child: DataTable(
                            columns: [''');
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
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        const Text('$fieldName', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 94, 54, 54)), textAlign: TextAlign.center,),
                        if (columnSortStates['${field.name}'] != null) ...[
                          Icon(
                            columnSortStates['${field.name}'] == 1
                                ? Icons.arrow_drop_up_rounded 
                                : Icons.arrow_drop_down_rounded,
                            color: Colors.black,
                          ),
                          Text(
                            '\${columnSortStates.keys.toList().indexOf('${field.name}') + 1}',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ],
                    ),
                  ), 
                  onSort:(columnIndex, ascending) => {
                    onSort('${field.name}')
                  },
                ),
              ''');
          }
      }
  } else {
      for (var defaultField in defaultFields) {
          var field = classElement.fields.firstWhere((f) => f.name == defaultField);
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
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        const Text('$fieldName', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 94, 54, 54)), textAlign: TextAlign.center,),
                        if (columnSortStates['${field.name}'] != null) ...[
                          Icon(
                            columnSortStates['${field.name}'] == 1
                                ? Icons.arrow_drop_up_rounded 
                                : Icons.arrow_drop_down_rounded,
                            color: Colors.black,
                          ),
                          Text(
                            '\${columnSortStates.keys.toList().indexOf('${field.name}') + 1}',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ],
                    ),
                  ), 
                  onSort:(columnIndex, ascending) => {
                    onSort('${field.name}')
                  },
                ),
              ''');
              }
      }
  }
    buffer.writeln('''
        ],
        rows: List<DataRow>.generate($classNamePlural.length, (index) {
          var $classNameLowercase = $classNamePlural[index];
          
          return DataRow(
            selected: widget.selectedStates[index],
            cells: [
''');

    for (var field in defaultFields.isEmpty ? visitor.fields.keys : defaultFields) {
      var field_info = classElement.fields.firstWhere((element) => element.name == field);
      var fieldType = field_info.type.toString();
      String relation = '';
      relation = _fieldChecker
              .firstAnnotationOfExact(field_info)
              ?.getField('relation')
              ?.toStringValue() ?? relation;
      bool uspaceMap = false;
      uspaceMap = _fieldChecker
              .firstAnnotationOfExact(field_info)
              !.getField('uspaceMap')?.toBoolValue() ?? uspaceMap;
      if (relation != '') {
        if (fieldType == 'String' || fieldType == 'String?') {
            buffer.writeln('''
DataCell(Center(
  child: FutureBuilder<List<$relation>>(
    future: fetch${relation}List([$classNameLowercase.$field ?? '']),
    builder: (context, snapshot) {
      if (snapshot.connectionState ==
              ConnectionState.waiting ||
          snapshot.data == null) {
        return const CircularProgressIndicator();
      } else {
        return Wrap(
          spacing: 4,
          children: snapshot.data!.map((${relation.toLowerCase()}) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ${relation}Widget(
                      element: ${relation.toLowerCase()},
                      isEditing: true,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Styles.buttonPrimaryColor),
                elevation:
                    MaterialStateProperty.resolveWith<double>((states) {
                  if (states.contains(MaterialState.hovered) ||
                      states.contains(MaterialState.pressed)) {
                    return 0;
                  }
                  return 0;
                }),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                overlayColor:
                    MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Styles.buttonPrimaryColorHover;
                  }
                  return Colors.transparent;
                }),
              ),
              child: Text(
                ${relation.toLowerCase()}.name!,
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
        );
      }
    },
  ),
),
onTap: () => {
  _navigateElement($classNameLowercase)
},
),
''');
        }
        else {
            buffer.writeln('''
DataCell(Center(
  child: FutureBuilder<List<$relation>>(
    future: fetch${relation}List($classNameLowercase.$field),
    builder: (context, snapshot) {
      if (snapshot.connectionState ==
              ConnectionState.waiting ||
          snapshot.data == null) {
        return const CircularProgressIndicator();
      } else {
        return Wrap(
          spacing: 4,
          children: snapshot.data!.map((${relation.toLowerCase()}) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ${relation}Widget(
                      element: ${relation.toLowerCase()},
                      isEditing: true,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Styles.buttonPrimaryColor),
                elevation:
                    MaterialStateProperty.resolveWith<double>((states) {
                  if (states.contains(MaterialState.hovered) ||
                      states.contains(MaterialState.pressed)) {
                    return 0;
                  }
                  return 0;
                }),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                overlayColor:
                    MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Styles.buttonPrimaryColorHover;
                  }
                  return Colors.transparent;
                }),
              ),
              child: Text(
                ${relation.toLowerCase()}.name!,
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
        );
      }
    },
  ),
),
onTap: () => {
  _navigateElement($classNameLowercase)
},
),
''');
          }
      } else {
        if ( fieldType == "LineString" || fieldType == "MultiLineString" || fieldType == "MultiPoint" || fieldType == "MultiPolygon" || fieldType == "Point" || fieldType == "Polygon" ||
            fieldType == "LineString?" || fieldType == "MultiLineString?" || fieldType == "MultiPoint?" || fieldType == "MultiPolygon?" || fieldType == "Point?" || fieldType == "Polygon?" ) {
          buffer.writeln('''
          DataCell(Center(
                    child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapScreenView(${fieldType.replaceAll("?", "")}View(
                          $classNameLowercase.$field!.geometry.coordinates, $classNameLowercase.$field!.properties, MediaQuery.of(context).size.height, $uspaceMap)),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Styles.buttonPrimaryColor),
                    elevation:
                        MaterialStateProperty.resolveWith<double>((states) {
                      if (states.contains(MaterialState.hovered) ||
                          states.contains(MaterialState.pressed)) {
                        return 0;
                      }
                      return 0;
                    }),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    overlayColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Styles.buttonPrimaryColorHover;
                      }
                      return Colors.transparent;
                    }),
                  ),
                  child: const Text(
                    "$fieldType",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
                onTap: () => {
                  _navigateElement($classNameLowercase)
                },
                ),
        ''');
        }
        else {
          buffer.writeln('''
          DataCell(Center(child: Text($classNameLowercase.$field.toString())),
          onTap: () => {
            _navigateElement($classNameLowercase)
          },
          ),
        ''');
        }
      }
    }

    buffer.writeln('''
                        ],
                            onSelectChanged: (selected) {
                              setState(() {
                                widget.selectedStates[index] = selected!;
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),),
                  const SizedBox(height: 8),
                ],
              ),
            ],
          ),
        ),
          CustomPagination(
            currentPage: data.currentPage,
            maxPages: data.maxPages,
            onPageSelected: (pageNumber) => _onPageButtonPressed(
                pageNumber, ref, paginationState, data.maxPages),
          )
        ]);
      },
    ));
  }

  void _onPageButtonPressed(int pageNumber, WidgetRef ref, ${className}PaginationState paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(${classNameLowercase}PaginationProvider.notifier).setPage(pageNumber);
    }
  }

  void _navigateElement($className $classNameLowercase) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ${className}Widget(
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
''');


    return buffer.toString();
  }
}