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
                            columns: const [''');
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
                child: Text('$fieldName', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 94, 54, 54)), textAlign: TextAlign.center,)
              ), 
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

  void _onPageButtonPressed(int pageNumber, WidgetRef ref, Tuple2<int, int> paginationState, int maxPages) {
    if (pageNumber <= maxPages) {
      ref.read(${classNameLowercase}PaginationProvider.notifier).setPage(pageNumber);
    }
  }
}

      
class ${className}PaginationNotifier extends StateNotifier<Tuple2<int, int>> {
  ${className}PaginationNotifier() : super(const Tuple2<int, int>(0, $pageSize));

  void setPage(int page) {
    state = Tuple2(page*state.item2 - state.item2, state.item2);
  }
}

final ${classNameLowercase}PaginationProvider =
    StateNotifierProvider<${className}PaginationNotifier, Tuple2<int, int>>(
  (ref) => ${className}PaginationNotifier(),
);
''');


    return buffer.toString();
  }
}