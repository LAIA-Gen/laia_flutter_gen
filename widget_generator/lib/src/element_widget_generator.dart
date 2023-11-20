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

    buffer.writeln('''
class ${visitor.className}Widget extends StatefulWidget {
  final ${visitor.className} element;

  const ${visitor.className}Widget(this.element, {Key? key}) : super(key: key);

  @override
  _${visitor.className}WidgetState createState() => _${visitor.className}WidgetState();
}

class _${visitor.className}WidgetState extends State<${visitor.className}Widget> {''');
    for (var fieldName in visitor.fields.keys) {
      String fieldType = visitor.fields[fieldName];

      switch (fieldType) {
        case 'int':
        case 'int?':
          buffer.writeln("final GlobalKey<IntWidgetState> ${fieldName}WidgetKey = GlobalKey<IntWidgetState>();");
          break;
      }
    }
    buffer.writeln('''

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${visitor.className}'),
      ),
      body: Column(
        children: [
''');
    for (var fieldName in visitor.fields.keys) {
      String fieldType = visitor.fields[fieldName];
      String fieldAccessor = 'widget.element.$fieldName';

      switch (fieldType) {
        case 'int':
        case 'int?':
          buffer.writeln('''
          IntWidget(
            key: ${fieldName}WidgetKey,
            fieldName: "$fieldName",
            fieldDescription: "This is a description",
            editable: true,
            placeholder: "This is a placeholder",
            value: $fieldAccessor,
          ),
''');
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
        default:
          buffer.writeln('defaultWidget("$fieldName", $fieldAccessor),');
          break;
      }
    }
    buffer.writeln('],');
    buffer.writeln('),');
    buffer.writeln('''
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ''');
        final List<String> updatedFields = [];
        for (var fieldName in visitor.fields.keys) {
          String fieldType = visitor.fields[fieldName];

          switch (fieldType) {
            case 'int':
            case 'int?':
              buffer.writeln('''
          int? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
''');         updatedFields.add('$fieldName: updated$fieldName');
              break;
          }
        }
    
    buffer.writeln('''
          ${visitor.className} updated${visitor.className} = widget.element.copyWith(
            ${updatedFields.join(',\n  ')}
          );
          var container = ProviderContainer();
          try {
            await container.read(update${visitor.className}Provider(updated${visitor.className}));
            print('${visitor.className} updated successfully');
          } catch (error) {
            print('Failed to update ${visitor.className}: \$error');
          }
        },
        child: Icon(Icons.save),
      ),
''');
    buffer.writeln(');');
    buffer.writeln('}');
    buffer.writeln('}');

    return buffer.toString();
  }
}