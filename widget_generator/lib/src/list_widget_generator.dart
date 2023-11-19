// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:widget_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

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
        data: (List<$className> $classNamePlural) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                columns: const [''');

    for (var field in defaultFields.isEmpty ? visitor.fields.keys : defaultFields) {
      buffer.writeln('''
        DataColumn(
          label: Expanded(
            child: Text('$field', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 94, 54, 54)), textAlign: TextAlign.center,)
          ), 
        ),
      ''');
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
                showCheckboxColumn: false
              )
            )
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () =>
                ref.read(${classNameLowercase}PaginationProvider.notifier).decrementPage(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 224, 221, 221),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () =>
                ref.read(${classNameLowercase}PaginationProvider.notifier).incrementPage(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 224, 221, 221),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
class ${className}PaginationNotifier extends StateNotifier<Tuple2<int, int>> {
  ${className}PaginationNotifier() : super(const Tuple2<int, int>(0, $pageSize));

  void incrementPage() => state = Tuple2(state.item1 + $pageSize, state.item2);
  void decrementPage() {
    if (state.item1 != 0) {
      state = Tuple2(state.item1 - $pageSize, state.item2);
    }
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