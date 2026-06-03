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
    print("EXECUTING ElementWidgetGenerator");
    final buffer = StringBuffer();
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    final fieldsKeys = visitor.fields.keys.toList();

    String DisplayField(String varName) {
      final List<String> fallbackKeys = [];
      final nicenameKey = fieldsKeys.firstWhere(
        (k) => k.toLowerCase() == 'nicename',
        orElse: () => '',
      );
      if (nicenameKey.isNotEmpty) {
        fallbackKeys.add(nicenameKey);
      }
      final nameTitleKey = fieldsKeys.firstWhere(
        (k) => k.toLowerCase() == 'name' || k.toLowerCase() == 'title',
        orElse: () => '',
      );
      if (nameTitleKey.isNotEmpty) {
        fallbackKeys.add(nameTitleKey);
      }
      final notIdKey = fieldsKeys.firstWhere(
        (k) => k != 'id',
        orElse: () => '',
      );
      if (notIdKey.isNotEmpty) {
        fallbackKeys.add(notIdKey);
      }
      if (fieldsKeys.isNotEmpty) {
        fallbackKeys.add(fieldsKeys.first);
      }
      if (fieldsKeys.contains('id')) {
        fallbackKeys.add('id');
      }
      final uniqueFallbackKeys = fallbackKeys.toSet().toList();
      final List<String> chain = [];
      for (final fieldName in uniqueFallbackKeys) {
        final type = visitor.fields[fieldName] as String?;
        final isNullable =
            type == null || type.endsWith('?') || type == 'dynamic';
        chain.add('$varName.$fieldName');
        if (!isNullable) {
          break;
        }
      }
      if (chain.isEmpty) {
        return "''";
      }
      final lastFieldName = uniqueFallbackKeys[chain.length - 1];
      final lastType = visitor.fields[lastFieldName] as String?;
      final lastIsNullable =
          lastType == null || lastType.endsWith('?') || lastType == 'dynamic';
      if (lastIsNullable) {
        chain.add("''");
      }
      if (chain.length == 1) {
        return '${chain[0]}.toString()';
      }
      return '(${chain.join(' ?? ')}).toString()';
    }

    ClassElement classElement = element as ClassElement;
    final auth = annotation.read('auth').boolValue;
    final List<List<String>> defaultFieldsDetail = annotation
        .read('defaultFieldsDetail')
        .listValue
        .map(
          (element) => (element.toListValue() ?? [])
              .map((e) => e.toStringValue() ?? '')
              .toList(),
        )
        .toList();

    final List<Map<String, dynamic>> tabs = [];
    final tabsannotation = annotation.peek('tabs');
    if (tabsannotation != null && !tabsannotation.isNull) {
      for (final tabObj in tabsannotation.listValue) {
        final tab = ConstantReader(tabObj);
        final label = tab.read('label').stringValue;
        final fields = tab.read('fields').listValue.map((e) => e.toStringValue() ?? '').toList();
        tabs.add({
          'label': label,
          'fields': fields,
        });
      }
    }

    final List<String> allTabFields = tabs.isNotEmpty
        ? tabs.expand((t) => t['fields'] as List<dynamic>).map((e) => e.toString()).toList()
        : [];

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

    buffer.writeln(
      '''
	class ${visitor.className}Widget extends StatefulWidget {
	  final ${visitor.className}? element;
	  final bool isEditing;

  const ${visitor.className}Widget({this.element, required this.isEditing, Key? key}) : super(key: key);

  @override
  _${visitor.className}WidgetState createState() => _${visitor.className}WidgetState();
	}

	class _${visitor.className}WidgetState extends State<${visitor.className}Widget> {''',
    );
    bool isEmbeddedObjectField(var field) {
      final fieldType = field.type.toString();
      final typeElement = field.type.element;
      final primitiveTypes = {
        'int',
        'int?',
        'String',
        'String?',
        'double',
        'double?',
        'DateTime',
        'DateTime?',
        'bool',
        'bool?',
        'dynamic',
        'Map<String, dynamic>',
        'Map<String, dynamic>?',
        'List<Map<String, dynamic>>',
        'List<Map<String, dynamic>>?',
        'List<String>',
        'List<String>?',
        'LineString',
        'MultiLineString',
        'MultiPoint',
        'MultiPolygon',
        'Point',
        'Polygon',
        'LineString?',
        'MultiLineString?',
        'MultiPoint?',
        'MultiPolygon?',
        'Point?',
        'Polygon?',
      };
      if (fieldType.startsWith('List<') || fieldType.startsWith('Map<')) {
        return false;
      }
      return !primitiveTypes.contains(fieldType) && typeElement is! EnumElement;
    }

    bool isEnumField(var field) {
      return field.type.element is EnumElement;
    }

    bool isEnumListField(var field) {
      final type = field.type;
      if (type.isDartCoreList) {
        try {
          final typeArg = (type as dynamic).typeArguments.first;
          return typeArg.element is EnumElement;
        } catch (_) {}
      }
      return false;
    }

    bool isUIField(String fieldName) {
      if (tabs.isNotEmpty) {
        return allTabFields.contains(fieldName) ||
            allTabFields.any((tf) => tf.startsWith('$fieldName.'));
      }
      if (defaultFieldsDetail.isEmpty) {
        return fieldName != 'id' &&
            fieldName != 'owner' &&
            fieldName != 'Shard';
      } else {
        return defaultFieldsDetailNames.contains(fieldName);
      }
    }

    String normalizedType(String fieldType) {
      return fieldType.replaceAll('?', '');
    }

    String capitalize(String value) {
      if (value.isEmpty) {
        return value;
      }
      return value[0].toUpperCase() + value.substring(1);
    }

    String embeddedKeyName(String parentFieldName, String fieldName) {
      return '$parentFieldName${capitalize(fieldName)}WidgetKey';
    }

    List<FieldElement> embeddedFieldsFor(var field) {
      final typeElement = field.type.element;
      if (typeElement is! ClassElement) {
        return const [];
      }
      return typeElement.fields
          .where(
            (nestedField) =>
                !nestedField.isStatic &&
                nestedField.name != 'id' &&
                nestedField.name != 'owner' &&
                nestedField.name != 'nicename',
          )
          .toList();
    }

    String widgetForField(var field) {
      final fieldType = field.type.toString();
      switch (fieldType) {
        case 'int':
        case 'int?':
          return 'IntWidget';
        case 'double':
        case 'double?':
          return 'DoubleWidget';
        case 'String':
        case 'String?':
          return 'StringWidget';
        case 'DateTime':
        case 'DateTime?':
          return 'DateTimeWidget';
        case 'bool':
        case 'bool?':
          return 'BoolWidget';
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
          return 'MapWidget';
        case 'dynamic':
          return 'JsonWidget';
        default:
          if (isEnumListField(field)) {
            final innerType = fieldType.replaceAll('List<', '').replaceAll('>', '').replaceAll('?', '').trim();
            return 'EnumMultiDropdownWidget<$innerType>';
          }
          if (isEnumField(field)) {
            return 'EnumDropdownWidget<${normalizedType(fieldType)}>';
          }
          if (isEmbeddedObjectField(field)) {
            return 'EmbeddedObjectWidget<${normalizedType(fieldType)}>';
          }
          return 'DefaultWidget';
      }
    }

    String widgetStateForField(var field) {
      final widget = widgetForField(field);
      if (widget.startsWith('EnumMultiDropdownWidget<')) {
        return widget.replaceFirst(
          'EnumMultiDropdownWidget',
          'EnumMultiDropdownWidgetState',
        );
      }
      if (widget.startsWith('EnumDropdownWidget<')) {
        return widget.replaceFirst(
          'EnumDropdownWidget',
          'EnumDropdownWidgetState',
        );
      }
      if (widget.startsWith('EmbeddedObjectWidget<')) {
        return widget.replaceFirst(
          'EmbeddedObjectWidget',
          'EmbeddedObjectWidgetState',
        );
      }
      return '${widget}State';
    }

    String fallbackForFieldType(String fieldType) {
      switch (fieldType) {
        case 'int':
          return '0';
        case 'double':
          return '0.0';
        case 'String':
          return "''";
        case 'DateTime':
          return 'DateTime.now()';
        case 'bool':
          return 'false';
        default:
          return 'null';
      }
    }

    globalKeyDeclarationCode(var field) {
      var bufferGlobalKey = StringBuffer();
      String fieldName = field.name;
      String fieldType = field.type.toString();
      String normalizedFieldType = fieldType.replaceAll('?', '');

      String widget = 'DefaultWidgetState';
      String? widgetState;
      if (isEmbeddedObjectField(field)) {
        for (var nestedField in embeddedFieldsFor(field)) {
          final nestedKeyName = embeddedKeyName(fieldName, nestedField.name);
          final nestedState = widgetStateForField(nestedField);
          bufferGlobalKey.writeln(
            "final GlobalKey<$nestedState> $nestedKeyName = GlobalKey<$nestedState>();",
          );
        }
      }

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
          break;
        default:
          if (isEnumListField(field)) {
            final innerType = fieldType.replaceAll('List<', '').replaceAll('>', '').replaceAll('?', '').trim();
            widget = 'EnumMultiSelectWidget<$innerType>';
            widgetState = 'EnumMultiSelectWidgetState<$innerType>';
          } else if (isEnumField(field)) {
            widget = 'EnumDropdownWidget<$normalizedFieldType>';
            widgetState = 'EnumDropdownWidgetState<$normalizedFieldType>';
          } else if (isEmbeddedObjectField(field)) {
            widget = 'EmbeddedObjectWidget<$normalizedFieldType>';
            widgetState = 'EmbeddedObjectWidgetState<$normalizedFieldType>';
          } else {
            widget = 'DefaultWidget';
          }
          break;
      }

      if (_fieldChecker.hasAnnotationOfExact(field)) {
        String widgetValue =
            _fieldChecker
                .firstAnnotationOfExact(field)
                ?.getField('widget')
                ?.toStringValue() ??
            '';
        if (widgetValue.isNotEmpty) {
          widget = widgetValue;
          widgetState = null;
        }
        String relation = '';
        relation =
            _fieldChecker
                .firstAnnotationOfExact(field)
                ?.getField('relation')
                ?.toStringValue() ??
            relation;
        if (relation != '') {
          if (widgetValue.isNotEmpty) {
            widget = widgetValue;
            widgetState = null;
          } else if (fieldType == 'String' || fieldType == 'String?') {
            widget = '${relation}FieldWidget';
            widgetState = null;
          } else {
            widget = '${relation}MultiFieldWidget';
            widgetState = null;
          }
        }
      }

      widgetState ??= '${widget}State';
      bufferGlobalKey.writeln(
        "final GlobalKey<$widgetState> ${fieldName}WidgetKey = GlobalKey<$widgetState>();",
      );
      return bufferGlobalKey;
    }

    if (tabs.isNotEmpty) {
      for (var field in classElement.fields) {
        final name = field.name;
        if (name == 'id' || name == 'owner' || name == 'Shard') continue;
        if (isUIField(name)) {
          buffer.writeln(globalKeyDeclarationCode(field));
        }
      }
    } else if (defaultFieldsDetail.isEmpty) {
      for (var field in classElement.fields) {
        buffer.writeln(globalKeyDeclarationCode(field));
      }
    } else {
      for (var defaultField in defaultFieldsDetailNames) {
        print("defaultField: $defaultField");
        print(
          "classElement.fields: ${classElement.fields.map((f) => f.name).toList()}",
        );
        var field = classElement.fields.firstWhere(
          (f) => f.name == defaultField,
        );
        buffer.writeln(globalKeyDeclarationCode(field));
      }
    }
    if (tabs.isNotEmpty) {
      buffer.writeln('''

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => ${visitor.className}ListView(),
              ),
            ),
          ), 
        ),
        body: Column(
          children: [
            const SizedBox(height: 16),
            Center(
              child: Text(
                '${visitor.className}',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                      color: AppColors.indigo,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GenericTabsWidget(
                tabLabels: const [
                  ${tabs.map((t) => '"${t['label']}"').join(',\n')}
                ],
                tabViews: [
''');
    } else {
      buffer.writeln('''

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => ${visitor.className}ListView(),
              ),
            ),
          ), 
        ),
        body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Text(
                '${visitor.className}',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                      color: AppColors.indigo,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
''');
    }
    embeddedFieldWidgetCode(var parentField, var nestedField) {
      final bufferNested = StringBuffer();
      final parentFieldName = parentField.name;
      final nestedFieldName = nestedField.name;
      final nestedFieldType = nestedField.type.toString();
      final nestedWidget = widgetForField(nestedField);
      final nestedKey = embeddedKeyName(parentFieldName, nestedFieldName);
      final nestedDisplayName = nestedFieldName;
      final nestedDescription = "This is the $nestedFieldName";
      final nestedPlaceholder = 'Type the $nestedFieldName';
      final nestedAccessor =
          'widget.element?.$parentFieldName?.$nestedFieldName';

      bufferNested.writeln(
        '''
              $nestedWidget(
                key: $nestedKey,
                fieldName: "$nestedDisplayName",
                fieldDescription: "$nestedDescription",
                editable: true,
                ${nestedWidget == 'BoolWidget' ? "" : "placeholder: \"$nestedPlaceholder\","}''',
      );

      if (nestedWidget.startsWith('EnumDropdownWidget<')) {
        final enumType = normalizedType(nestedFieldType);
        bufferNested.writeln('''
                value: $nestedAccessor,
                options: $enumType.values,
              ),''');
      } else if (nestedWidget.startsWith('EnumMultiDropdownWidget<')) {
        final innerType = nestedFieldType.replaceAll('List<', '').replaceAll('>', '').replaceAll('?', '').trim();
        bufferNested.writeln('''
                value: $nestedAccessor,
                options: $innerType.values,
              ),''');
      } else {
        bufferNested.writeln('''
                value: $nestedAccessor,
              ),''');
      }

      return bufferNested.toString();
    }

    embeddedConstructorFieldCode(var parentField, var nestedField) {
      final parentFieldName = parentField.name;
      final nestedFieldName = nestedField.name;
      final nestedFieldType = nestedField.type.toString();
      final nestedKey = embeddedKeyName(parentFieldName, nestedFieldName);
      final previousAccessor =
          'widget.element?.$parentFieldName?.$nestedFieldName';
      final currentAccessor = '$nestedKey.currentState?.getUpdatedValue()';
      if (nestedFieldType.endsWith('?')) {
        return '$nestedFieldName: $currentAccessor ?? $previousAccessor,';
      }
      return '$nestedFieldName: $currentAccessor ?? $previousAccessor ?? ${fallbackForFieldType(nestedFieldType)},';
    }

    embeddedObjectWidgetCode(
      var field,
      String fieldDisplayName,
      String fieldDescription,
      String placeholder,
      bool editable,
    ) {
      final bufferEmbedded = StringBuffer();
      final fieldName = field.name;
      final fieldType = field.type.toString();
      final normalizedFieldType = normalizedType(fieldType);
      final nestedFields = embeddedFieldsFor(field);
      final nestedWidgets = nestedFields
          .map((nestedField) => embeddedFieldWidgetCode(field, nestedField))
          .join('\n');
      final nestedConstructorFields = nestedFields
          .map(
            (nestedField) => embeddedConstructorFieldCode(field, nestedField),
          )
          .join('\n');

      bufferEmbedded.writeln('''
          EmbeddedObjectWidget<$normalizedFieldType>(
            key: ${fieldName}WidgetKey,
            fieldName: "$fieldDisplayName",
            fieldDescription: "$fieldDescription",
            editable: $editable,
            placeholder: "$placeholder",
            value: widget.element?.$fieldName,
            getValue: () {
              return $normalizedFieldType(
$nestedConstructorFields
              );
            },
            child: Column(
              children: [
$nestedWidgets
              ],
            ),
          ),
      ''');
      return bufferEmbedded.toString();
    }

    fieldWidgetCode(var field) {
      var bufferfieldWidget = StringBuffer();
      String fieldName = field.name;
      String fieldDisplayName = fieldName;
      String fieldType = field.type.toString();
      String normalizedFieldType = fieldType.replaceAll('?', '');
      String fieldAccessor = 'widget.element?.$fieldName';
      String widget = 'defaultWidget';
      String fieldDescription = "This is the $fieldName";
      String placeholder = 'Type the $fieldName';
      bool uspaceMap = false;
      bool editable = true;
      String relation = '';

      if (_fieldChecker.hasAnnotationOfExact(field)) {
        String fieldDisplayNameValue =
            _fieldChecker
                .firstAnnotationOfExact(field)
                ?.getField('fieldName')
                ?.toStringValue() ??
            '';
        if (fieldDisplayNameValue.isNotEmpty) {
          fieldDisplayName = fieldDisplayNameValue;
        }
        String fieldDescriptionValue =
            _fieldChecker
                .firstAnnotationOfExact(field)
                ?.getField('fieldDescription')
                ?.toStringValue() ??
            fieldDescription;
        if (fieldDescriptionValue.isNotEmpty) {
          fieldDescription = fieldDescriptionValue;
        }
        editable =
            _fieldChecker
                .firstAnnotationOfExact(field)
                ?.getField('editable')
                ?.toBoolValue() ??
            editable;
        uspaceMap =
            _fieldChecker
                .firstAnnotationOfExact(field)
                ?.getField('uspaceMap')
                ?.toBoolValue() ??
            uspaceMap;
        String placeholderValue =
            _fieldChecker
                .firstAnnotationOfExact(field)
                ?.getField('placeholder')
                ?.toStringValue() ??
            placeholder;
        if (placeholderValue.isNotEmpty) {
          placeholder = placeholderValue;
        }
        relation =
            _fieldChecker
                .firstAnnotationOfExact(field)
                ?.getField('relation')
                ?.toStringValue() ??
            relation;
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
          break;
        default:
          if (isEnumListField(field)) {
            final innerType = fieldType.replaceAll('List<', '').replaceAll('>', '').replaceAll('?', '').trim();
            widget = 'EnumMultiSelectWidget<$innerType>';
          } else if (isEnumField(field)) {
            widget = 'EnumDropdownWidget<$normalizedFieldType>';
          } else if (isEmbeddedObjectField(field)) {
            widget = 'EmbeddedObjectWidget<$normalizedFieldType>';
          } else {
            widget = 'DefaultWidget';
          }
          break;
      }

      String widgetValue =
          _fieldChecker
              .firstAnnotationOfExact(field)
              ?.getField('widget')
              ?.toStringValue() ??
          '';
      if (widgetValue.isNotEmpty) {
        widget = widgetValue;
      }

      var multiRelation = false;

      if (relation != '') {
        if (widgetValue.isNotEmpty) {
          widget = widgetValue;
          if (widget.endsWith('MultiFieldWidget')) {
            multiRelation = true;
          }
        } else if (fieldType == 'String' || fieldType == 'String?') {
          widget = '${relation}FieldWidget';
        } else {
          widget = '${relation}MultiFieldWidget';
          multiRelation = true;
        }
      }

      print(
        '[LAIA widget field] model=${visitor.className} field=$fieldName fieldType=$fieldType widget=$widget',
      );

      if (widget.startsWith("EmbeddedObjectWidget<")) {
        return embeddedObjectWidgetCode(
          field,
          fieldDisplayName,
          fieldDescription,
          placeholder,
          editable,
        );
      }

      bufferfieldWidget.writeln(
        '''
          $widget(
            key: ${fieldName}WidgetKey,
            fieldName: "$fieldDisplayName",
            fieldDescription: "$fieldDescription",
            editable: $editable,
            ${widget == 'BoolWidget' ? "" : "placeholder: \"$placeholder\","}
            ${relation.isNotEmpty || widgetValue.isEmpty || widgetValue == "ModelsSelectableWidget" ? '' : 'elementId: widget.element?.id,'}''',
      );

      if (multiRelation) {
        bufferfieldWidget.writeln('''
            values: ($fieldAccessor is List) ? ($fieldAccessor as List).map<String>((e) => e is Map ? e['id']?.toString() ?? '' : e.toString()).toList() : ($fieldAccessor != null ? [($fieldAccessor ?? '').toString()] : null),
          ),
      ''');
      } else {
        if (widget == "MapWidget") {
          bufferfieldWidget.writeln('''
	            value: $fieldAccessor  ?? ${fieldType.replaceAll("?", "")}(type: "Feature", geometry: Geometry${fieldType.replaceAll("?", "")}(coordinates: [], type: "${fieldType.replaceAll("?", "")}"), properties: {}),
	            uspaceMap: $uspaceMap
	          ),
	      ''');
        } else if (widget.startsWith("EnumDropdownWidget<")) {
          bufferfieldWidget.writeln('''
	            value: $fieldAccessor,
              options: $normalizedFieldType.values,
	          ),
	      ''');
        } else if (widget.startsWith("EnumMultiDropdownWidget<")) {
          final innerType = fieldType.replaceAll('List<', '').replaceAll('>', '').replaceAll('?', '').trim();
          bufferfieldWidget.writeln('''
	            value: $fieldAccessor ?? [],
              options: $innerType.values,
	          ),
	      ''');
        } else if (relation != '') {
          bufferfieldWidget.writeln('''
	            value: ($fieldAccessor is Map) ? ($fieldAccessor as Map)['id']?.toString() : $fieldAccessor?.toString(),
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

    if (tabs.isNotEmpty) {
      for (var tab in tabs) {
        final tabFields = tab['fields'] as List<dynamic>;
        buffer.writeln('''
                    KeepAliveWrapper(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
        ''');
        for (var field in classElement.fields) {
          final name = field.name;
          if (name == 'id' || name == 'owner' || name == 'Shard') continue;
          if (tabFields.contains(name) || tabFields.any((tf) => tf.toString().startsWith('$name.'))) {
            buffer.writeln(fieldWidgetCode(field));
          }
        }
        buffer.writeln('''
                          ],
                        ),
                      ),
                    ),
        ''');
      }
      buffer.writeln('''
                ],
              ),
            ),
            const SizedBox(height: 16),
            SaveButton(
              text: 'Save',
              onTap: () async {
        var initial${visitor.className} = widget.element;
      ''');
    } else {
      if (defaultFieldsDetail.isEmpty) {
        for (var field in classElement.fields) {
          final name = field.name;
          if (name == 'id' || name == 'owner' || name == 'Shard') continue;
          buffer.writeln(fieldWidgetCode(field));
        }
      } else {
        for (List<String> row in defaultFieldsDetailRows) {
          buffer.writeln('''
                  Row(
                    children: [''');

          for (String fieldName in row) {
            var field = classElement.fields.firstWhere(
              (f) => f.name == fieldName,
            );
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
      buffer.writeln('''
              const SizedBox(height: 16),
              SaveButton(
                text: 'Save',
                onTap: () async {
          var initial${visitor.className} = widget.element;
      ''');
    }
    final List<String> updatedFields = [];
    for (var fieldName in visitor.fields.keys) {
      var writeCode = false;
      if (tabs.isNotEmpty) {
        writeCode = true;
      } else if (defaultFieldsDetail.isEmpty) {
        writeCode = true;
      } else {
        if (defaultFieldsDetailNames.contains(fieldName)) {
          writeCode = true;
        }
      }
      if (writeCode) {
        String fieldType = visitor.fields[fieldName];

        if (isUIField(fieldName)) {
          switch (fieldType) {
            case 'int':
              buffer.writeln('''
              int? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'int?':
              buffer.writeln('''
              int? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'double':
              buffer.writeln('''
              double? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'double?':
              buffer.writeln('''
              double? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'String':
              buffer.writeln('''
              String? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'String?':
              buffer.writeln('''
              String? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'List<String>':
              buffer.writeln('''
              List<String>? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'List<String>?':
              buffer.writeln('''
              List<String>? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'DateTime':
              buffer.writeln('''
              DateTime? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'DateTime?':
              buffer.writeln('''
              DateTime? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'bool':
              buffer.writeln('''
              bool? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'bool?':
              buffer.writeln('''
              bool? updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            case 'LineString':
            case 'MultiLineString':
            case 'MultiPoint':
            case 'MultiPolygon':
            case 'Point':
            case 'Polygon':
              buffer.writeln('''
              dynamic updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();

              updated$fieldName = ${fieldType.replaceAll("?", "")}(type: "Feature", geometry: Geometry${fieldType.replaceAll("?", "")}(coordinates:updated$fieldName.geometry.coordinates, type: updated$fieldName.geometry.type), properties: updated$fieldName.properties);
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
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
    ''');
              updatedFields.add('$fieldName: updated$fieldName');
              break;
            default:
              if (fieldType.endsWith('?')) {
                buffer.writeln('''
              $fieldType updated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
    ''');
              } else {
                buffer.writeln('''
              dynamic rawUpdated$fieldName = ${fieldName}WidgetKey.currentState?.getUpdatedValue();
              $fieldType updated$fieldName = rawUpdated$fieldName as $fieldType;
    ''');
              }
              updatedFields.add('$fieldName: updated$fieldName');
              break;
          }
        } else {
          buffer.writeln('''
            final updated$fieldName = widget.element?.$fieldName;
  ''');
          updatedFields.add('$fieldName: updated$fieldName');
        }
      }
    }

    buffer.writeln(
      '''
          ${visitor.className} updated${visitor.className} = widget.element ?? ${visitor.className}(''',
    );

    for (var fieldName in visitor.fields.keys) {
      var writeCode = false;
      if (tabs.isNotEmpty) {
        writeCode = true;
      } else if (defaultFieldsDetail.isEmpty) {
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
            buffer.writeln(
              '''$fieldName: updated$fieldName ?? DateTime.now(),''',
            );
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
            buffer.writeln('''$fieldName: updated$fieldName,''');
            break;
        }
      }
    }

    buffer.writeln('''
          );

          updated${visitor.className} = updated${visitor.className}.copyWith(
            ${updatedFields.join(',\n  ')}
          );
          Map<String, dynamic> updates = {};
          updates['id'] = widget.element?.id;
          var initialMap = initial${visitor.className}?.toJson() ?? {};
          var updatedMap = updated${visitor.className}.toJson();
          updatedMap.forEach((key, value) {
            if (key != 'id' && !const DeepCollectionEquality().equals(value, initialMap[key])) {
              updates[key] = value;
            }
          });
          var container = ProviderContainer();
          try {
            if (widget.isEditing) {
              if (updates.keys.where((key) => key != 'id').isNotEmpty) {
                await container.read(
                  update${visitor.className}Provider(Tuple2(updates, context)).future);
                if (context.mounted) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => ${visitor.className}ListView(),
                    ),
                  );
                }
              } else {
                CustomSnackBar.show(context, "No changes were detected");
              }
            } else {
              await container.read(create${visitor.className}Provider(Tuple2(updated${visitor.className}, context)).future);
              if (context.mounted) {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => ${visitor.className}ListView(),
                  ),
                );
              }
            }
          } catch (error) {
            print('Failed to update ${visitor.className}: \$error');
          }
        },
              ),
              const SizedBox(height: 80),
      ''');
    if (tabs.isNotEmpty) {
      buffer.writeln('],');
      buffer.writeln('),');
    } else {
      buffer.writeln('],');
      buffer.writeln('),');
      buffer.writeln('),');
    }

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
    if (widget.value != null && widget.value!.isNotEmpty) {
      try {
        ${visitor.className} ${visitor.className.toLowerCase()} = await container.read(
                        get${visitor.className}Provider(widget.value!).future);
        _typeAheadController.text = '\${${DisplayField(visitor.className.toLowerCase())}} <id: \${${visitor.className.toLowerCase()}.id}>';
      } catch (e) {
        debugPrint("Error loading ${visitor.className}: \$e");
        _typeAheadController.text = '<id: \${widget.value}>';
      }
    } else {
      _typeAheadController.text = '';
    }
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
              color: AppColors.surface),
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
                            builder: (context, controller, focusNode) {
                              return Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  color: AppColors.surface,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: AppColors.muted),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: controller,
                                        focusNode: focusNode,
                                        decoration: InputDecoration(
                                          hintText: '',
                                          contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(14),
                                            borderSide: const BorderSide(
                                              color: AppColors.muted,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(14),
                                            borderSide: const BorderSide(
                                              color: AppColors.muted,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(14),
                                            borderSide: const BorderSide(
                                              color: AppColors.indigo,
                                              width: 1.2,
                                            ),
                                          ),
                                          fillColor: AppColors.surface,
                                          focusColor: AppColors.surface,
                                          hoverColor: AppColors.surface
                                        ),
                                      )
                                    )
                                  ]
                                )
                              );
                            },
                            suggestionsCallback: (String pattern) async {
                              final ${visitor.className.toLowerCase()}PaginationData = await container.read(
                                getAll${visitor.className}Provider(container.read(${visitor.className.toLowerCase()}PaginationProvider)).future);
                              final options = ${visitor.className.toLowerCase()}PaginationData.items;
                              return options
                              .where((${visitor.className.toLowerCase()}) =>
                                  ${DisplayField(visitor.className.toLowerCase())}.toLowerCase().contains(pattern.toLowerCase()) ||
                                  ${visitor.className.toLowerCase()}.id.toString().contains(pattern.toLowerCase()))
                              .toList();
                            },
                            itemBuilder: (context, ${visitor.className.toLowerCase()}) {
                              return ListTile(
                                title: Text('\${${DisplayField(visitor.className.toLowerCase())}} <id: \${${visitor.className.toLowerCase()}.id}>'),
                              );
                            },
                            onSelected: (${visitor.className} value) {
                              setState(() {
                                isValueChanged = value.id != initialValue;
                                currentValue = value.id!;
                                _typeAheadController.text = '\${${DisplayField('value')}} <id: \${value.id}>';
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
    if (widget.values != null && widget.values!.isNotEmpty) {
      try {
        final List<String> displayTexts = [];
        for (final value in widget.values!) {
          if (value.isEmpty) continue;
          try {
            final item = await container.read(get${visitor.className}Provider(value).future);
            displayTexts.add('\${${DisplayField('item')}} <id: \${item.id}>');
          } catch (e) {
            debugPrint("Error loading ${visitor.className} item \$value: \$e");
            displayTexts.add('<id: \$value>');
          }
        }
        _typeAheadController.text = displayTexts.isNotEmpty ? '\${displayTexts.join(', ')}, ' : '';
      } catch (e) {
        debugPrint("Error initializing ${visitor.className}MultiFieldWidget: \$e");
        _typeAheadController.text = (widget.values ?? []).join(', ');
      }
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
              color: AppColors.surface),
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
                            builder: (context, controller, focusNode) {
                              return Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  color: AppColors.surface,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: AppColors.surface),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: controller,
                                        focusNode: focusNode,
                                        decoration: InputDecoration(
                                          hintText: '',
                                          contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(14),
                                            borderSide: const BorderSide(
                                              color: AppColors.muted,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(14),
                                            borderSide: const BorderSide(
                                              color: AppColors.muted,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(14),
                                            borderSide: const BorderSide(
                                              color: AppColors.indigo,
                                              width: 1.2,
                                            ),
                                          ),
                                          fillColor: AppColors.surface,
                                          focusColor: AppColors.surface,
                                          hoverColor: AppColors.surface
                                        ),
                                      )
                                    )
                                  ]
                                )
                              );
                            },

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
                                  ${DisplayField(visitor.className.toLowerCase())}.toLowerCase().contains(inputParts.toLowerCase()) ||
                                  ${visitor.className.toLowerCase()}.id.toString().toLowerCase().contains(inputParts.toLowerCase()))
                              .toList();
                            },
                            itemBuilder: (context, ${visitor.className.toLowerCase()}) {
                              return ListTile(
                                title: Text('\${${DisplayField(visitor.className.toLowerCase())}} <id: \${${visitor.className.toLowerCase()}.id}>'),
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
                                return '\${${DisplayField(visitor.className.toLowerCase())}} <id: \${${visitor.className.toLowerCase()}.id}>';
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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      topLeftBrand: Image.asset(
        'assets/logo.png',
        width: 80,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Log In',
            style: Theme.of(context).textTheme.headlineLarge
          ),
          const SizedBox(height: 8),
          Text(
            'Log in to access your account',
            style: Theme.of(context).textTheme.bodyMedium
          ),
          const SizedBox(height: 70),

          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.mail_outline),
            ),
          ),
          const SizedBox(height: 14),

          TextField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () => setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                }),
              ),
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: 230,
            child: ElevatedButton(
              onPressed: () async {
                final container = ProviderContainer();
                final loginData = Auth(
                  email: _emailController.text.trim(),
                  password: _passwordController.text,
                );

                try {
                  final result =
                      await container.read(loginUserProvider(loginData).future);

                  if (!mounted) return;

                  if (result.success) {
                    Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder: (_, __, ___) => Home()),
                    );
                  } else {
                    CustomSnackBar.show(context, result.errorMessage);
                  }
                } catch (e) {
                  // opcional: snackbar genérico
                  debugPrint(e.toString());
                }
              },
              child: Text('Log In'),
            ),
          ),

          const SizedBox(height: 40),

          Text(
            "I don’t have an account",
            style: Theme.of(context).textTheme.bodySmall
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 88, child: Divider(color: AppColors.indigo)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => UserRegisterWidget()),
                    );
                  },
                  child: Text('Register', style: Theme.of(context).textTheme.labelSmall),
                ),
              ),
              const SizedBox(width: 88, child: Divider(color: AppColors.indigo)),
            ],
          ),
        ],
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
  final TextEditingController _confirmController = TextEditingController();
  ''');

      for (var fieldName in visitor.fields.keys) {
        String fieldType = visitor.fields[fieldName];

        if (fieldType == "String" &&
            fieldName != 'email' &&
            fieldName != 'password') {
          buffer.writeln(
            '''final TextEditingController _${fieldName}Controller = TextEditingController();''',
          );
        }
      }

      buffer.writeln('''
  bool _isPasswordVisible = false;
  bool _isConfirmVisible = false;

  // Reglas password (según la imagen)
  bool get _hasUppercase => RegExp(r'[A-Z]').hasMatch(_passwordController.text);
  bool get _hasNumber => RegExp(r'\\d').hasMatch(_passwordController.text);
  bool get _hasMinLen => _passwordController.text.length >= 8;
  bool get _passwordsMatch =>
      _passwordController.text.isNotEmpty &&
      _passwordController.text == _confirmController.text;

  bool get _canSubmit =>
      _emailController.text.trim().isNotEmpty &&
  ''');
      for (var fieldName in visitor.fields.keys) {
        String fieldType = visitor.fields[fieldName];

        if (fieldType == "String" &&
            fieldName != 'email' &&
            fieldName != 'password' &&
            fieldName != 'id') {
          buffer.writeln(
            ''' _${fieldName}Controller.text.trim().isNotEmpty &&''',
          );
        }
      }
      buffer.writeln('''
      _hasUppercase &&
      _hasNumber &&
      _hasMinLen &&
      _passwordsMatch;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onChanged);
    _confirmController.addListener(_onChanged);
    _emailController.addListener(_onChanged);
    ''');
      for (var fieldName in visitor.fields.keys) {
        String fieldType = visitor.fields[fieldName];

        if (fieldType == "String" &&
            fieldName != 'email' &&
            fieldName != 'password' &&
            fieldName != 'id') {
          buffer.writeln(
            ''' _${fieldName}Controller..addListener(_onChanged);''',
          );
        }
      }
      buffer.writeln('''
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.removeListener(_onChanged);
    _confirmController.removeListener(_onChanged);
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      topLeftBrand: Image.asset(
        'assets/logo.png',
        width: 80,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Register', style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 8),
              Text('Register to create an account', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 24),
              // Email
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.mail_outline),
                ),
              ),
              const SizedBox(height: 14),
              // Password
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () => setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Confirm password
              TextField(
                controller: _confirmController,
                obscureText: !_isConfirmVisible,
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () => setState(() {
                      _isConfirmVisible = !_isConfirmVisible;
                    }),
                  ),
                ),
              ),
              ''');

      for (var fieldName in visitor.fields.keys) {
        String fieldType = visitor.fields[fieldName];

        String capitalize(String s) =>
            s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

        if (fieldType == "String" &&
            fieldName != 'email' &&
            fieldName != 'password' &&
            fieldName != 'id') {
          buffer.writeln('''
            const SizedBox(height: 14),
            TextField(
              controller: _${fieldName}Controller,
              decoration: const InputDecoration(
                hintText: '${capitalize(fieldName)}',
                prefixIcon: Icon(Icons.text_format),
              ),
            ),
''');
        }
      }
      buffer.writeln('''
            const SizedBox(height: 12),   
            // Reglas password (como en la imagen)
            _PasswordRules(
              hasUppercase: _hasUppercase,
              hasNumber: _hasNumber,
              hasMinLen: _hasMinLen,
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: 230,
              child: ElevatedButton(
                onPressed: _canSubmit ? () async {
                  if (_passwordController.text != _confirmController.text) {
                    CustomSnackBar.show(context, "Passwords do not match");
                    return;
                  }
                  var container = ProviderContainer();
                  var registerData = ${visitor.className}(
                    email: _emailController.text,
                    password: _passwordController.text,''');
      for (var fieldName in visitor.fields.keys) {
        String fieldType = visitor.fields[fieldName];

        if (fieldType == "String" &&
            fieldName != 'email' &&
            fieldName != 'password') {
          buffer.writeln('''$fieldName: _${fieldName}Controller.text,''');
        } else if (fieldType == "int") {
          buffer.writeln('''$fieldName: 0,''');
        } else if (fieldType == "double") {
          buffer.writeln('''$fieldName: 0.0,''');
        } else if (fieldType == "DateTime") {
          buffer.writeln('''$fieldName: DateTime.now(),''');
        } else if (fieldType == "bool") {
          buffer.writeln('''$fieldName: false,''');
        } else if (fieldType == "Map<String, dynamic>" ||
            fieldType == "List<Map<String, dynamic>>") {
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
                      Navigator.push(
                        context,
                        PageRouteBuilder(pageBuilder: (_, __, ___) => Home()),
                      );
                    } else {
                      CustomSnackBar.show(context, registerResult.errorMessage);
                    }
                  } catch (error) {
                    print(error);
                  }
                } : null,
                child: Text('Register'),
              ),
            ),
            const SizedBox(height: 40),

            Text("I already have an account", style: Theme.of(context).textTheme.bodySmall),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 88, child: Divider(color: AppColors.indigo)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(pageBuilder: (_, __, ___) => UserLoginWidget()),
                      );
                    },
                    child: Text('Log In', style: Theme.of(context).textTheme.labelSmall),
                  ),
                ),
                const SizedBox(width: 88, child: Divider(color: AppColors.indigo)),
              ],
            ),
          ],
        ),
      ),
    ),);
  }

}

class _PasswordRules extends StatelessWidget {
  final bool hasUppercase;
  final bool hasNumber;
  final bool hasMinLen;

  const _PasswordRules({
    required this.hasUppercase,
    required this.hasNumber,
    required this.hasMinLen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RuleRow(
          ok: hasUppercase,
          text: 'At least 1 uppercase',
          highlightWhenOk: true,
        ),
        const SizedBox(height: 4),
        _RuleRow(
          ok: hasNumber,
          text: 'At least 1 number',
          highlightWhenOk: true,
        ),
        const SizedBox(height: 4),
        _RuleRow(
          ok: hasMinLen,
          text: 'At least 8 characters',
          highlightWhenOk: true,
        ),
      ],
    );
  }
}

class _RuleRow extends StatelessWidget {
  final bool ok;
  final String text;
  final bool highlightWhenOk;

  const _RuleRow({
    required this.ok,
    required this.text,
    this.highlightWhenOk = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final icon = ok ? Icons.check_circle : Icons.radio_button_unchecked;
    final color = ok ? cs.primary : AppColors.muted;
    final textColor = (ok && highlightWhenOk) ? cs.primary : AppColors.muted;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: textColor,
                fontWeight: ok ? FontWeight.w600 : FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
''');
    }

    return buffer.toString();
  }
}
