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

    buffer.writeln('@override');
    buffer.writeln('Widget build(BuildContext context) {');
    buffer.writeln('return Column(');
    buffer.writeln('children: [');
    for (var fieldName in visitor.fields.keys) {
      String fieldType = visitor.fields[fieldName];
      String fieldAccessor = 'element.$fieldName';

      switch (fieldType) {
        case 'int':
        case 'int?':
          buffer.writeln('intWidget("$fieldName", $fieldAccessor),');
          break;
        case 'double':
        case 'double?':
          buffer.writeln('doubleWidget("$fieldName", $fieldAccessor),');
          break;
        case 'String':
        case 'String?':
          buffer.writeln('stringWidget("$fieldName", $fieldAccessor),');
          break;
        case 'bool':
        case 'bool?':
          buffer.writeln('boolWidget("$fieldName", $fieldAccessor),');
          break;
        case 'List<String>':
        case 'List<String>?':
          buffer.writeln('stringListWidget("$fieldName", $fieldAccessor),');
          break;
      }
    }
    buffer.writeln('],');
    buffer.writeln(');');
    buffer.writeln('}');
    buffer.writeln('}');

    return buffer.toString();
  }
}