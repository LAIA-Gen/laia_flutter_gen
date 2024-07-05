// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:laia_annotations/laia_annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:laia_widget_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

const _fieldChecker = TypeChecker.fromRuntime(Field);

class ElementWidgetGenerator extends GeneratorForAnnotation<ElementWidgetGen> {
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
    final auth = annotation.read('auth').boolValue;
    final List<List<String>> defaultFieldsDetail = annotation
      .read('defaultFieldsDetail')
      .listValue
      .map((element) => (element.toListValue() ?? []).map((e) => e.toStringValue() ?? '').toList())
      .toList();

    List<String> defaultFieldsDetailNames = [];
    List<int> defaultFieldsDetailWidths = [];

    defaultFieldsDetail.forEach((field) {

      String name = field[0];
      int width = field.length > 1 ? int.tryParse(field[1]) ?? 100 : 100;

      defaultFieldsDetailNames.add(name);
      defaultFieldsDetailWidths.add(width);
    });

    List<List<String>> defaultFieldsDetailRows = [];
    List<String> currentRow = [];
    int currentWidth = 0;

    for (int i = 0; i < defaultFieldsDetailNames.length; i++) {
      String name = defaultFieldsDetailNames[i];
      int width = defaultFieldsDetailWidths[i];
      
      if (currentWidth + width <= 100) {
        currentRow.add(name);
        currentWidth += width;
      } else {
        defaultFieldsDetailRows.add(currentRow);
        currentRow = [name];
        currentWidth = width;
      }
    }

    if (currentRow.isNotEmpty) {
      defaultFieldsDetailRows.add(currentRow);
    }

    buffer.writeln('''
class ${visitor.className}Widget extends StatefulWidget {
  final ${visitor.className}? element;
  final bool isEditing;

  const ${visitor.className}Widget({this.element, required this.isEditing, Key? key}) : super(key: key);

  @override
  _${visitor.className}WidgetState createState() => _${visitor.className}WidgetState();
}

class _${visitor.className}WidgetState extends State<${visitor.className}Widget> {''');
    globalKeyDeclarationCode(var field) {
      var bufferGlobalKey = StringBuffer();
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
        case 'bool':
        case 'bool?':
          widget = 'BoolWidget';
          break;
        case 'LineString':
        case 'MultiLineString':
        case 'MultiPoint':
        case 'MultiPolygon':
        case 'Point':
        case 'Polygon':
        case 'LineString?':
        case 'MultiLineString?':
        case 'MultiPoint?':
        case 'MultiPolygon?':
        case 'Point?':
        case 'Polygon?':
          widget = 'MapWidget';
          break;
        case 'dynamic':
          widget = 'JsonWidget';
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
          if (fieldType == 'String' || fieldType == 'String?') {
            widget = '${relation}FieldWidget';
          }
          else {
            widget = '${relation}MultiFieldWidget';
          }
        }
      }

      bufferGlobalKey.writeln("final GlobalKey<${widget}State> ${fieldName}WidgetKey = GlobalKey<${widget}State>();");
      return bufferGlobalKey;
    }
    if (defaultFieldsDetail.isEmpty) {
      for (var field in classElement.fields) {
        buffer.writeln(globalKeyDeclarationCode(field));
      }
    } else {
      for (var defaultField in defaultFieldsDetailNames) {
        var field = classElement.fields.firstWhere((f) => f.name == defaultField);
        buffer.writeln(globalKeyDeclarationCode(field));
      }
    }
    buffer.writeln('''

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('${visitor.className}'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ${visitor.className}ListView()),
            ),
          ), 
        ),
        body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
''');
    fieldWidgetCode(var field) {
      var bufferfieldWidget = StringBuffer();
      String fieldName = field.name;
      String fieldDisplayName = fieldName;
      String fieldType = field.type.toString();
      String fieldAccessor = 'widget.element?.$fieldName';
      String widget = 'defaultWidget';
      String fieldDescription = "This is the $fieldName";
      String placeholder = 'Type the $fieldName';
      bool uspaceMap = false;
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
        uspaceMap = _fieldChecker
              .firstAnnotationOfExact(field)
              ?.getField('uspaceMap')
              ?.toBoolValue() ?? uspaceMap;
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
        case 'LineString':
        case 'MultiLineString':
        case 'MultiPoint':
        case 'MultiPolygon':
        case 'Point':
        case 'Polygon':
        case 'LineString?':
        case 'MultiLineString?':
        case 'MultiPoint?':
        case 'MultiPolygon?':
        case 'Point?':
        case 'Polygon?':
          widget = 'MapWidget';
          break;
        case 'dynamic':
          widget = 'JsonWidget';
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

      var multiRelation = false;

      if (relation != '') {
        if (fieldType == 'String' || fieldType == 'String?') {
          widget = '${relation}FieldWidget';
        }
        else {
          widget = '${relation}MultiFieldWidget';
          multiRelation = true;
        }
      }

      bufferfieldWidget.writeln('''
          $widget(
            key: ${fieldName}WidgetKey,
            fieldName: "$fieldDisplayName",
            fieldDescription: "$fieldDescription",
            editable: $editable,
            ${widget == 'BoolWidget' ? "" : "placeholder: \"$placeholder\","}
            ${widgetValue.isEmpty || widgetValue == "ModelsSelectableWidget" ? '' : 'elementId: widget.element?.id,' }''');

      if (multiRelation) {
        bufferfieldWidget.writeln('''
            values: $fieldAccessor,
          ),
      ''');
      } else {
        if (widget == "MapWidget") {
          bufferfieldWidget.writeln('''
            value: $fieldAccessor  ?? ${fieldType.replaceAll("?", "")}(type: "Feature", geometry: Geometry${fieldType.replaceAll("?", "")}(coordinates: [], type: "${fieldType.replaceAll("?", "")}"), properties: {}),
            uspaceMap: $uspaceMap
          ),
      ''');
        } else {
          bufferfieldWidget.writeln('''
            value: $fieldAccessor,
          ),
      ''');
        }
        
      }
      return bufferfieldWidget;
    }
    if (defaultFieldsDetail.isEmpty) {
      for (var field in classElement.fields) {
        buffer.writeln(fieldWidgetCode(field));
      }
    } else {
      for (List<String> row in defaultFieldsDetailRows) {
        buffer.writeln('''
                Row(
                  children: [''');

        for (String fieldName in row) {
          var field = classElement.fields.firstWhere((f) => f.name == fieldName);
          buffer.writeln('''
                    Expanded(
                      flex: ${defaultFieldsDetailWidths[defaultFieldsDetailNames.indexOf(fieldName)]},
                      child: ${fieldWidgetCode(field)}
                    ),''');
        }

        buffer.writeln('''
                  ],
                ),''');
      }
    }
    buffer.writeln('],');
    buffer.writeln('),');
    buffer.writeln('),');
    buffer.writeln('''
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var initial${visitor.className} = widget.element;
          Map<String, dynamic> updates = {};
          updates['id'] = widget.element?.id;
          ''');
        final List<String> updatedFields = [];
        for (var fieldName in visitor.fields.keys) {
          var writeCode = false;
          if (defaultFieldsDetail.isEmpty) {
            writeCode = true;
          } else {
            if (defaultFieldsDetailNames.contains(fieldName)) {
              writeCode = true;
            }
          }
          if (writeCode) {
            String fieldType = visitor.fields[fieldName];

            switch (fieldType) {
              case 'int':
                buffer.writeln('''
            updates['$fieldName'] = widget.element?.$fieldName;
            int? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'int?':
                buffer.writeln('''
            int? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'double':
                buffer.writeln('''
            updates['$fieldName'] = widget.element?.$fieldName;
            double? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'double?':
                buffer.writeln('''
            double? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'String':
                buffer.writeln('''
            updates['$fieldName'] = widget.element?.$fieldName;
            String? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'String?':
                buffer.writeln('''
            String? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'List<String>':
                buffer.writeln('''
            updates['$fieldName'] = widget.element?.$fieldName;
            List<String>? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'List<String>?':
                buffer.writeln('''
            List<String>? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'DateTime':
                buffer.writeln('''
            updates['$fieldName'] = widget.element?.$fieldName;
            DateTime? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'DateTime?':
                buffer.writeln('''
            DateTime? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'bool':
                buffer.writeln('''
            updates['$fieldName'] = widget.element?.$fieldName;
            bool? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'bool?':
                buffer.writeln('''
            bool? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'LineString':
              case 'MultiLineString':
              case 'MultiPoint':
              case 'MultiPolygon':
              case 'Point':
              case 'Polygon':
                buffer.writeln('''
            updates['$fieldName'] = widget.element?.$fieldName;
            dynamic updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();

            updated$fieldName = ${fieldType.replaceAll("?", "")}(type: "Feature", geometry: Geometry${fieldType.replaceAll("?", "")}(coordinates:updated$fieldName.geometry.coordinates, type: updated$fieldName.geometry.type), properties: updated$fieldName.properties);
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              case 'LineString?':
              case 'MultiLineString?':
              case 'MultiPoint?':
              case 'MultiPolygon?':
              case 'Point?':
              case 'Polygon?':
                buffer.writeln('''
            dynamic updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();

            updated$fieldName = ${fieldType.replaceAll("?", "")}(type: "Feature", geometry: Geometry${fieldType.replaceAll("?", "")}(coordinates:updated$fieldName.geometry.coordinates, type: updated$fieldName.geometry.type), properties: updated$fieldName.properties);
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              default:
                buffer.writeln('''
            dynamic updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
  ''');         updatedFields.add('$fieldName: updated$fieldName');
                break;
              
            }
            if (fieldName == 'id') {
              buffer.writeln('''updates['id'] = updatedid;''');
            } else {
              buffer.writeln('''
if (updated$fieldName != initial${visitor.className}?.$fieldName) {
  updates['$fieldName'] = updated$fieldName;
}
''');
            }
          }
        }
    
    buffer.writeln('''
          ${visitor.className} updated${visitor.className} = widget.element ?? ${visitor.className}(''');
    
    for (var fieldName in visitor.fields.keys) {
      var writeCode = false;
      if (defaultFieldsDetail.isEmpty) {
        writeCode = true;
      } else {
        if (defaultFieldsDetailNames.contains(fieldName)) {
          writeCode = true;
        }
      }
      if (writeCode) {
        String fieldType = visitor.fields[fieldName];

        switch (fieldType) {
          case 'int':
          case 'int?':
            buffer.writeln('''$fieldName: updated$fieldName ?? 0,''');
            break;
          case 'double':
          case 'double?':
            buffer.writeln('''$fieldName: updated$fieldName ?? 0.0,''');
            break;
          case 'String':
          case 'String?':
            buffer.writeln('''$fieldName: updated$fieldName ?? '',''');
            break;
          case 'DateTime':
          case 'DateTime?':
            buffer.writeln('''$fieldName: updated$fieldName ?? DateTime.now(),''');
            break;
          case 'bool':
          case 'bool?':
            buffer.writeln('''$fieldName: updated$fieldName ?? false,''');
            break;
          case 'Map<String, dynamic>':
          case 'Map<String, dynamic>?':
          case 'List<Map<String, dynamic>>':
          case 'List<Map<String, dynamic>>?':
            buffer.writeln('''$fieldName: updated$fieldName ?? {},''');
            break;
          case 'List<String>':
          case 'List<String>?':
            buffer.writeln('''$fieldName: updated$fieldName ?? [''],''');
            break;
          default:
            buffer.writeln('''$fieldName: updated$fieldName ?? '',''');
                break;
        }
      }
    }

    buffer.writeln('''
          );

          updated${visitor.className} = updated${visitor.className}.copyWith(
            ${updatedFields.join(',\n  ')}
          );
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              if(updates.isNotEmpty) {
                await container.read(
                  update${visitor.className}Provider(Tuple2(updates, context)));
              } else {
                CustomSnackBar.show(context, "No changes were detected");
              }
            } else {
              await container.read(create${visitor.className}Provider(Tuple2(updated${visitor.className}, context)));
            }
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
                                  ${visitor.className.toLowerCase()}.name!.toLowerCase().contains(pattern.toLowerCase()) ||
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
                                currentValue = value.id!;
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
                    builder: (context) => ${visitor.className}Widget(element: ${visitor.className.toLowerCase()}, isEditing: true),
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

  buffer.writeln('''
class ${visitor.className}MultiFieldWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final List<String>? values;

  const ${visitor.className}MultiFieldWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.values,
  }) : super(key: key);

  @override
  ${visitor.className}MultiFieldWidgetState createState() => ${visitor.className}MultiFieldWidgetState();
}

class ${visitor.className}MultiFieldWidgetState extends State<${visitor.className}MultiFieldWidget> {
  final TextEditingController _typeAheadController = TextEditingController();
  bool isValueChanged = false;
  late List<String> initialValues = [];
  late List<String> currentValues = [];
  late List<${visitor.className}> options = [];

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  Future<void> initializeValues() async {
    super.initState();
    initialValues = widget.values ?? [];
    currentValues = initialValues;
    if (widget.values != null) {
      List<${visitor.className}> ${visitor.className.toLowerCase()}List = await Future.wait(
        (widget.values ?? []).where((value) => value != '').map((value) async {
          return await container.read(get${visitor.className}Provider(value).future);
        }),
      );
      String concatenatedText = '\${${visitor.className.toLowerCase()}List.map((${visitor.className.toLowerCase()}) {
          return '\${${visitor.className.toLowerCase()}.name} <id: \${${visitor.className.toLowerCase()}.id}>';
        }).join(', ')}, ';
        _typeAheadController.text = concatenatedText;
    } else {
      _typeAheadController.text = '';
    }
  }

  List<String>? getUpdatedValue() {
    return isValueChanged ? currentValues : initialValues;
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
                              final idRegex = RegExp(r'<id:\\\s*([a-fA-F0-9]+)\\\s*>');
                              final matches = idRegex.allMatches(pattern);
                              final ids = <String>[];
                              
                              for (final match in matches) {
                                ids.add(match.group(1)!);
                              }
                              currentValues = ids;
                              Function eq = const ListEquality().equals;
                              bool previusValue = isValueChanged;
                              isValueChanged = !eq(currentValues, initialValues.where((value) => value.isNotEmpty).toList());
                              if (previusValue != isValueChanged) {
                                setState(() {
                                  _typeAheadController.text = _typeAheadController.text;
                                });
                              }
                              final inputParts = pattern.split(',').last.trim();
                              container.read(${visitor.className.toLowerCase()}PaginationProvider.notifier).setFilters({'id': {'\\\$nin': currentValues}});
                              final ${visitor.className.toLowerCase()}PaginationData = await container
                                .read(getAll${visitor.className}Provider(container.read(${visitor.className.toLowerCase()}PaginationProvider)).future);
                              final options = ${visitor.className.toLowerCase()}PaginationData.items;
                              return options
                              .where((${visitor.className.toLowerCase()}) =>
                                  ${visitor.className.toLowerCase()}.name!.toLowerCase().contains(inputParts.toLowerCase()) ||
                                  ${visitor.className.toLowerCase()}.id.toString().toLowerCase().contains(inputParts.toLowerCase()))
                              .toList();
                            },
                            itemBuilder: (context, ${visitor.className.toLowerCase()}) {
                              return ListTile(
                                title: Text('\${${visitor.className.toLowerCase()}.name} <id: \${${visitor.className.toLowerCase()}.id}>'),
                              );
                            },
                            onSelected: (${visitor.className} value) async {
                              isValueChanged = !initialValues.contains(value.id);
                              currentValues.add(value.id!);
                              
                              List<${visitor.className}> ${visitor.className.toLowerCase()}List = await Future.wait(
                              (currentValues).where((value) => value != '').map((value) async {
                                return await container.read(get${visitor.className}Provider(value).future);
                              }));
                              String concatenatedText = '\${${visitor.className.toLowerCase()}List.map((${visitor.className.toLowerCase()}) {
                                return '\${${visitor.className.toLowerCase()}.name} <id: \${${visitor.className.toLowerCase()}.id}>';
                              }).join(', ')}, ';

                              setState(() {
                                _typeAheadController.text = concatenatedText;
                              });
                            },
                          ),
                        )
                      : Text(widget.values.toString()),
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
                final query = {
                  'id': {'\\\$in': currentValues.where((value) => value.isNotEmpty).toList()}
                };
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ${visitor.className}ListView(extraFilters: query),
                  ),
                );
              } catch (error) {
                print('Failed to fetch ${visitor.className.toLowerCase()}s: \$error');
              }
            },
            child: const Text('View ${visitor.className}s'),
          ),
        ),
      ],
    );
  }
}
''');

    if (auth) {
      buffer.writeln('''
class ${visitor.className}LoginWidget extends StatefulWidget {
  final ${visitor.className}? element;

  const ${visitor.className}LoginWidget({this.element, Key? key})
      : super(key: key);

  @override
  _${visitor.className}LoginWidgetState createState() => _${visitor.className}LoginWidgetState();
}

class _${visitor.className}LoginWidgetState extends State<${visitor.className}LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.2),
            _buildTextField(
              controller: _emailController,
              labelText: 'Email',
            ),
            _buildTextField(
              controller: _passwordController,
              labelText: 'Password',
              isPassword: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  var container = ProviderContainer();
                  var loginData = Auth(
                    email: _emailController.text,
                    password: _passwordController.text
                  );
                  try {
                    AuthResult loginResult = await container.read(login${visitor.className}Provider(loginData).future);
                    if (loginResult.success) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    } else {
                      CustomSnackBar.show(context, loginResult.errorMessage);
                    }
                  } catch (error) {
                    print(error);
                  }
                },
                child: const Text('Login'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ${visitor.className}RegisterWidget()),
                );
              },
              child: const Text("I don't have an account: Register"),
            ),
          ],
        ),
      ),
    ),);
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool isPassword = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Styles.secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          obscureText: isPassword && !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class ${visitor.className}RegisterWidget extends StatefulWidget {
  final ${visitor.className}? element;

  const ${visitor.className}RegisterWidget({this.element, Key? key})
      : super(key: key);

  @override
  _${visitor.className}RegisterWidgetState createState() => _${visitor.className}RegisterWidgetState();
}

class _${visitor.className}RegisterWidgetState extends State<${visitor.className}RegisterWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  ''');

  for (var fieldName in visitor.fields.keys) {
    String fieldType = visitor.fields[fieldName];

    if (fieldType == "String" && fieldName != 'email' && fieldName != 'password') {
      buffer.writeln('''final TextEditingController _${fieldName}Controller = TextEditingController();''');
    }
  }

  buffer.writeln('''
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.2),
            _buildTextField(
              controller: _emailController,
              labelText: 'Email',
            ),
            _buildTextField(
              controller: _passwordController,
              labelText: 'Password',
              isPassword: true,
            ),
            _buildTextField(
              controller: _confirmPasswordController,
              labelText: 'Confirm password',
              isPassword: true,
            ),
            ''');

  for (var fieldName in visitor.fields.keys) {
    String fieldType = visitor.fields[fieldName];

    if (fieldType == "String" && fieldName != 'email' && fieldName != 'password') {
      buffer.writeln('''
            _buildTextField(
              controller: _${fieldName}Controller,
              labelText: '$fieldName',
            ),
''');
    }
  }
  buffer.writeln('''
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_passwordController.text != _confirmPasswordController.text) {
                    CustomSnackBar.show(context, "Passwords do not match");
                    return;
                  }
                  var container = ProviderContainer();
                  var registerData = ${visitor.className}(
                    email: _emailController.text,
                    password: _passwordController.text,''');
  for (var fieldName in visitor.fields.keys) {
    String fieldType = visitor.fields[fieldName];

    if (fieldType == "String" && fieldName != 'email' && fieldName != 'password') {
      buffer.writeln('''$fieldName: _${fieldName}Controller.text,''');
    } else if (fieldType == "int") {
      buffer.writeln('''$fieldName: 0,''');
    } else if (fieldType == "double") {
      buffer.writeln('''$fieldName: 0.0,''');
    } else if (fieldType == "DateTime") {
      buffer.writeln('''$fieldName: DateTime.now(),''');
    } else if (fieldType == "bool") {
      buffer.writeln('''$fieldName: false,''');
    } else if (fieldType == "Map<String, dynamic>" || fieldType == "Map<String, dynamic>" || fieldType == "List<Map<String, dynamic>>") {
      buffer.writeln('''$fieldName: {},''');
    } else if (fieldType.contains('List') && !fieldType.contains('?')) {
      buffer.writeln('''$fieldName: [],''');
    }
  }

  buffer.writeln('''
                  );
                  try {
                    AuthResult registerResult = await container.read(register${visitor.className}Provider(registerData).future);
                    if (registerResult.success) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    } else {
                      CustomSnackBar.show(context, registerResult.errorMessage);
                    }
                  } catch (error) {
                    print(error);
                  }
                },
                child: Text('Register'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ${visitor.className}LoginWidget()),
                );
              },
              child: Text("I already have an account: LogIn"),
            ),
          ],
        ),
      ),
    ),);
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool isPassword = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Styles.secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          obscureText: isPassword && !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
''');
    }

    return buffer.toString();
  }
}