// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:widget_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class ElementWidgetGenerator extends GeneratorForAnnotation<ElementWidgetGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element, 
    ConstantReader annotation, 
    BuildStep buildStep,
  ) {
    final buffer = StringBuffer();
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    buffer.writeln('class ${visitor.className}Widget extends StatelessWidget {');
    buffer.writeln('final ${visitor.className} element;');

    buffer.writeln('const ${visitor.className}Widget(this.element, {super.key});');

    for (var fieldName in visitor.fields.keys) {
      buffer.writeln('Widget get ${fieldName}Widget {');
      buffer.writeln('return ${generateWidget(fieldName, visitor.fields[fieldName], 'element.$fieldName')};');
      buffer.writeln('}');
    }

    buffer.writeln('@override');
    buffer.writeln('Widget build(BuildContext context) {');
    buffer.writeln('return Column(');
    buffer.writeln('children: [');
    for (var fieldName in visitor.fields.keys) {
      buffer.writeln('${fieldName}Widget,');
    }
    buffer.writeln('],');
    buffer.writeln(');');
    buffer.writeln('}');
    buffer.writeln('}');

    return buffer.toString();
  }

  String generateWidget(String fieldName, String fieldType, String fieldAccessor) {
    switch (fieldType) {
      case 'int':
      case 'double':
      case 'String':
        return '''
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$fieldName:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8.0),
                Text(${fieldAccessor.toString()}.toString()),
              ],
            ),
          )
        ''';
      case 'bool':
        return '''
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$fieldName:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: ${fieldAccessor.toString()} ? Colors.green : Colors.red,
                  ),
                  child: Text(
                    ${fieldAccessor.toString()} ? "Active" : "Inactive",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ''';
      case 'List<String>':
        return '''
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$fieldName:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var item in ${fieldAccessor.toString()}) Text("- \$item  "),
                  ],
                ),
              ],
            ),
          )
        ''';
      default:
        return '''
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$fieldName:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8.0),
              Text("\$${fieldAccessor.toString()}"),
            ],
          ),
        )
        ''';
    }
  }
}