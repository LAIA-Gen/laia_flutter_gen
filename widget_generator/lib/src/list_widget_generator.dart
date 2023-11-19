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

    var className = visitor.className;
    var classNameLowercase = className.toLowerCase();

    buffer.writeln('''
class ${className}ListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$className List'),
      ),
      body: FutureBuilder(
        future: getAll${className}Provider(0, limit: 10), // Example: Fetch the first 10 items
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: \${snapshot.error}');
          } else {
            List<$className> ${classNameLowercase}List = snapshot.data;
            return ListView.builder(
              itemCount: ${classNameLowercase}List.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('$className \${index + 1}: \${${classNameLowercase}List[index].toString()}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
''');

    return buffer.toString();
  }
}