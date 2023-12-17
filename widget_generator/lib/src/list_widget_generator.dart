// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:widget_generator/src/model_visitor.dart';
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
    // final widget = annotation.read('widget').stringValue;

    var className = visitor.className;
    var classNameLowercase = className.toLowerCase();
    var classNamePlural = '${classNameLowercase}s';

    buffer.writeln('''
class ${className}ListView extends ConsumerWidget {
  const ${className}ListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginationState = ref.watch(${classNameLowercase}PaginationProvider);
    final ${classNamePlural}AsyncValue =
        ref.watch(getAll${className}Provider(paginationState));

    final Map<String, int> columnSortStates = ref.watch(${classNameLowercase}PaginationProvider.notifier).getOrders();

    void _onSort(String columnName) {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('$className List'),
      ),
      body: ${classNamePlural}AsyncValue.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: \$error'),
        data: (${className}PaginationData data) {
          final $classNamePlural = data.items;
          return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          width: double.infinity,
                          child: DataTable(
                            columns: [''');
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
        if (!(defaultFields.isNotEmpty && !(defaultFields.contains(field.name)))) {
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
                _onSort('${field.name}')
              },
            ),
          ''');
        }
      }
    }

    buffer.writeln('''
        ],
        rows: $classNamePlural.map(($classNameLowercase) {
          return DataRow(
            cells: [
''');

    for (var field in defaultFields.isEmpty ? visitor.fields.keys : defaultFields) {
      buffer.writeln('''
        DataCell(Center(child: Text($classNameLowercase.$field.toString()))),
      ''');
    }

    buffer.writeln('''
                        ],
                            onSelectChanged: (selected) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ${className}Widget($classNameLowercase)),
                              );
                            },
                          );
                        }).toList(),
                        showCheckboxColumn: false,
                      ),
                    ),
                  ),
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
}

class ${className}PaginationState {
  final Tuple2<int, int> pagination;
  final Map<String, int> orders;

  ${className}PaginationState({
    required this.pagination,
    required this.orders,
  });
}

class ${className}PaginationNotifier extends StateNotifier<${className}PaginationState> {
  ${className}PaginationNotifier() : super(${className}PaginationState(
          pagination: const Tuple2<int, int>(0, $pageSize),
          orders: {},
        ));

  void setPage(int page) {
    state = ${className}PaginationState(
          pagination: Tuple2(page * state.pagination.item1 - state.pagination.item2, state.pagination.item2),
          orders: state.orders,
        );
  }

  void setOrders(Map<String, int> newOrders) {
    state = ${className}PaginationState(
          pagination: Tuple2(state.pagination.item1, state.pagination.item2),
          orders: newOrders,
        );
  }

  Map<String, int> getOrders() {
    return state.orders;
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