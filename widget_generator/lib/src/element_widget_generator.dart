// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:widget_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

const _fieldChecker = TypeChecker.fromRuntime(Field);

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
    ClassElement classElement = element as ClassElement;

    buffer.writeln('''
class ${visitor.className}Widget extends StatefulWidget {
  final ${visitor.className} element;

  const ${visitor.className}Widget(this.element, {Key? key}) : super(key: key);

  @override
  _${visitor.className}WidgetState createState() => _${visitor.className}WidgetState();
}

class _${visitor.className}WidgetState extends State<${visitor.className}Widget> {''');
    for (var field in classElement.fields) {
      String fieldName = field.name;
      String fieldType = field.type.toString();

      String widget = 'DefaultWidgetState';
    
      switch (fieldType) {
        case 'int':
        case 'int?':
          widget = 'IntWidget';
          break;
        case 'String':
        case 'String?':
          widget = 'StringWidget';
          break;
        case 'double':
        case 'double?':
          widget = 'DoubleWidget';
          break;
        case 'DateTime':
        case 'DateTime?':
          widget = 'DateTimeWidget';
          break;
        case 'Map<String, dynamic>':
        case 'Map<String, dynamic>?':
        case 'List<Map<String, dynamic>>':
        case 'List<Map<String, dynamic>>?':
          widget = 'MapWidget';
          break;
        default: 
          widget = 'DefaultWidget';
          break;
      }

      if (_fieldChecker.hasAnnotationOfExact(field)) {
        String widgetValue = _fieldChecker
              .firstAnnotationOfExact(field)
              ?.getField('widget')
              ?.toStringValue() ?? '';
        if (widgetValue.isNotEmpty) {
          widget = widgetValue;
        }
      }

      buffer.writeln("final GlobalKey<${widget}State> ${fieldName}WidgetKey = GlobalKey<${widget}State>();");
    }
    buffer.writeln('''

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('${visitor.className}'),
        ),
        body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
''');
    for (var field in classElement.fields) {
      String fieldName = field.name;
      String fieldDisplayName = fieldName;
      String fieldType = field.type.toString();
      String fieldAccessor = 'widget.element.$fieldName';
      String widget = 'defaultWidget';
      String fieldDescription = "This is the $fieldName";
      String placeholder = 'Type the $fieldName';
      bool editable = true;
      String relation = '';

      if (_fieldChecker.hasAnnotationOfExact(field)) {
        String fieldDisplayNameValue = _fieldChecker
              .firstAnnotationOfExact(field)
              ?.getField('fieldName')
              ?.toStringValue() ?? '';
        if (fieldDisplayNameValue.isNotEmpty) {
          fieldDisplayName = fieldDisplayNameValue;
        }
        String fieldDescriptionValue = _fieldChecker
              .firstAnnotationOfExact(field)
              ?.getField('fieldDescription')
              ?.toStringValue() ?? fieldDescription;
        if (fieldDescriptionValue.isNotEmpty) {
          fieldDescription = fieldDescriptionValue;
        }
        editable = _fieldChecker
              .firstAnnotationOfExact(field)
              ?.getField('editable')
              ?.toBoolValue() ?? editable;
        String placeholderValue = _fieldChecker
              .firstAnnotationOfExact(field)
              ?.getField('placeholder')
              ?.toStringValue() ?? placeholder; 
        if (placeholderValue.isNotEmpty) {
          placeholder = placeholderValue;
        }
        relation = _fieldChecker
              .firstAnnotationOfExact(field)
              ?.getField('relation')
              ?.toStringValue() ?? relation;
      }

      switch (fieldType) {
        case 'int':
        case 'int?':
          widget = 'IntWidget';
          break;
        case 'double':
        case 'double?':
          widget = 'DoubleWidget';
          break;
        case 'String':
        case 'String?':
          widget = 'StringWidget';
          break;
        case 'DateTime':
        case 'DateTime?':
          widget = 'DateTimeWidget';
          break;
        case 'bool':
        case 'bool?':
          widget = 'BoolWidget';
          break;
        case 'Map<String, dynamic>':
        case 'Map<String, dynamic>?':
        case 'List<Map<String, dynamic>>':
        case 'List<Map<String, dynamic>>?':
          widget = 'MapWidget';
          break;
        default:
          widget = 'DefaultWidget';
          break;
      }

      String widgetValue = _fieldChecker
            .firstAnnotationOfExact(field)
            ?.getField('widget')
            ?.toStringValue() ?? '';
      if (widgetValue.isNotEmpty) {
        widget = widgetValue;
      }

      buffer.writeln('''
          $widget(
            key: ${fieldName}WidgetKey,
            fieldName: "$fieldDisplayName",
            fieldDescription: "$fieldDescription",
            editable: $editable,
            placeholder: "$placeholder",
            value: $fieldAccessor,
          ),
      ''');

      if (relation != '') {
        buffer.writeln('''
          TextButton(
              onPressed: () async {
                var container = ProviderContainer();
                try {
                  $relation ${relation.toLowerCase()} = await container.read(get${relation}Provider(widget.element.$fieldName).future);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ${relation}Widget(${relation.toLowerCase()}),
                    ),
                  );
                } catch (error) {
                  print('Failed to fetch ${relation.toLowerCase()}: \$error');
                }
              },
              child: const Text('View $fieldDisplayName'),
            ),
      ''');
      }
    }
    buffer.writeln('],');
    buffer.writeln('),');
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
            case 'String':
            case 'String?':
              buffer.writeln('''
          String? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
''');         updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'DateTime':
            case 'DateTime?':
              buffer.writeln('''
          DateTime? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
''');         updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'Map<String, dynamic>':
            case 'Map<String, dynamic>?':
            case 'List<Map<String, dynamic>>':
            case 'List<Map<String, dynamic>>?':
              buffer.writeln('''
          dynamic updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
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