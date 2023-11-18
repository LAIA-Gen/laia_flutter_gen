// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:widget_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class GenericWidgetsGenerator extends GeneratorForAnnotation<GenericWidgetsGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element, 
    ConstantReader annotation, 
    BuildStep buildStep,
  ) {
    final buffer = StringBuffer();
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    buffer.writeln("Widget intWidget(String fieldName, int? value) {");
    buffer.writeln('''
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$fieldName:",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8.0),
                Text(value.toString()),
              ],
            ),
          );
        }
        ''');

    buffer.writeln("Widget defaultWidget(String fieldName, DateTime value) {");
    buffer.writeln('''
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$fieldName:",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8.0),
                Text(value.toString()),
              ],
            ),
          );
        }
        ''');

    buffer.writeln("Widget doubleWidget(String fieldName, double? value) {");
    buffer.writeln('''
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$fieldName:",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8.0),
                Text(value.toString()),
              ],
            ),
          );
        }
        ''');

    buffer.writeln("Widget stringWidget(String fieldName, String? value) {");
    buffer.writeln('''
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$fieldName:",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8.0),
                Text(value!),
              ],
            ),
          );
        }
        ''');

    buffer.writeln("Widget boolWidget(String fieldName, bool value) {");
    buffer.writeln("return Container(");
    buffer.writeln("  padding: const EdgeInsets.all(8.0),");
    buffer.writeln("  decoration: BoxDecoration(");
    buffer.writeln("    color: value ? Colors.green : Colors.red,");
    buffer.writeln("    borderRadius: BorderRadius.circular(8.0),");
    buffer.writeln("  ),");
    buffer.writeln("  child: Text(");
    buffer.writeln("    value ? 'Active' : 'Inactive',");
    buffer.writeln("    style: const TextStyle(color: Colors.white),");
    buffer.writeln("  ),");
    buffer.writeln(");");
    buffer.writeln("}");

    buffer.writeln("Widget stringListWidget(String fieldName, List<String> value) {");
    buffer.writeln("return Column(");
    buffer.writeln("  crossAxisAlignment: CrossAxisAlignment.start,");
    buffer.writeln("  children: [");
    buffer.writeln("    Text('\$fieldName:'),");
    buffer.writeln("    for (var item in value) Text('- \$item'),");
    buffer.writeln("  ],");
    buffer.writeln(");");
    buffer.writeln("}");

    buffer.writeln("Widget mapWidget(String fieldName, Map<String, dynamic> value) {");
    buffer.writeln("return Column(");
    buffer.writeln("  crossAxisAlignment: CrossAxisAlignment.start,");
    buffer.writeln("  children: [");
    buffer.writeln("    Text('\$fieldName:'),");
    buffer.writeln("    for (var entry in value.entries) Text('\${entry.key}: \${entry.value}'),");
    buffer.writeln("  ],");
    buffer.writeln(");");
    buffer.writeln("}");

    return buffer.toString();
  }
}