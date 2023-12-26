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
        String relation = '';
        relation = _fieldChecker
              .firstAnnotationOfExact(field)
              ?.getField('relation')
              ?.toStringValue() ?? relation;
        if (relation != '') {
          widget = '${relation}FieldWidget';
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

      if (relation != '') {
        widget = '${relation}FieldWidget';
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

    buffer.writeln('''
class ${visitor.className}FieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const ${visitor.className}FieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  ${visitor.className}FieldWidgetState createState() => ${visitor.className}FieldWidgetState();
}

class ${visitor.className}FieldWidgetState extends State<${visitor.className}FieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;
  late List<${visitor.className}> options;

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
    ${visitor.className} ${visitor.className.toLowerCase()} = await container.read(
                    get${visitor.className}Provider(widget.value!).future);
    _typeAheadController.text = '\${${visitor.className.toLowerCase()}.name} <id: \${${visitor.className.toLowerCase()}.id}>';
  }

  String? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  var container = ProviderContainer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Styles.secondaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\${widget.fieldName}:",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    widget.fieldDescription,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.editable
                      ? Expanded(
                          child: TypeAheadField<${visitor.className}>(
                            controller: _typeAheadController,
                            suggestionsCallback: (String pattern) async {
                              final ${visitor.className.toLowerCase()}PaginationData = await container.read(
                                getAll${visitor.className}Provider(container.read(${visitor.className.toLowerCase()}PaginationProvider)).future);
                              final options = ${visitor.className.toLowerCase()}PaginationData.items;
                              return options
                              .where((${visitor.className.toLowerCase()}) =>
                                  ${visitor.className.toLowerCase()}.name.toLowerCase().contains(pattern.toLowerCase()) ||
                                  ${visitor.className.toLowerCase()}.id.toString().contains(pattern.toLowerCase()))
                              .toList();
                            },
                            itemBuilder: (context, ${visitor.className.toLowerCase()}) {
                              return ListTile(
                                title: Text('\${${visitor.className.toLowerCase()}.name} <id: \${${visitor.className.toLowerCase()}.id}>'),
                              );
                            },
                            onSelected: (${visitor.className} value) {
                              setState(() {
                                isValueChanged = value.id != initialValue;
                                currentValue = value.id;
                                _typeAheadController.text = '\${value.name} <id: \${value.id}>';
                              });
                            },
                          ),
                        )
                      : Text(widget.value ?? widget.placeholder),
                ],
              ),
            ],
          ),
        ),
        if (isValueChanged)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
            ),
          ),
        Positioned(
          top: 0,
          right: 0,
          child: ElevatedButton(
            onPressed: () async {
              try {
                ${visitor.className} ${visitor.className.toLowerCase()} = await container.read(
                    get${visitor.className}Provider(widget.value!).future);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ${visitor.className}Widget(${visitor.className.toLowerCase()}),
                  ),
                );
              } catch (error) {
                print('Failed to fetch ${visitor.className.toLowerCase()}: \$error');
              }
            },
            child: const Text('View ${visitor.className}'),
          ),
        ),
      ],
    );
  }
}
''');

    return buffer.toString();
  }
}