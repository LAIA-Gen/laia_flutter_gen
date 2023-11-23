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

    buffer.writeln('''
class IntWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final int? value;

  const IntWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  IntWidgetState createState() => IntWidgetState();
}

class IntWidgetState extends State<IntWidget> {
  bool isValueChanged = false;
  late int? initialValue;
  late String currentValue;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue.toString();
  }

  int? getUpdatedValue() {
    return isValueChanged ? int.tryParse(currentValue) : initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
          ),
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
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            ],
                            decoration: InputDecoration(
                              hintText: widget.placeholder,
                            ),
                            initialValue: widget.value?.toString(),
                            onChanged: (newValue) {
                              setState(() {
                                isValueChanged = newValue != initialValue.toString();
                                currentValue = newValue;
                              });
                            },
                          ),
                        )
                      : Text(widget.value?.toString() ?? widget.placeholder),
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
      ],
    );
  }
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

    buffer.writeln('''
class StringWidget extends StatefulWidget {
  final String fieldName;
  final String fieldDescription;
  final bool editable;
  final String placeholder;
  final String? value;

  const StringWidget({
    Key? key,
    required this.fieldName,
    required this.fieldDescription,
    required this.editable,
    required this.placeholder,
    required this.value,
  }) : super(key: key);

  @override
  StringWidgetState createState() => StringWidgetState();
}

class StringWidgetState extends State<StringWidget> {
  bool isValueChanged = false;
  late String? initialValue;
  late String currentValue;

  @override
  void initState() {
    super.initState();
    initialValue = widget.value;
    currentValue = initialValue ?? '';
  }

  String? getUpdatedValue() {
    return isValueChanged ? currentValue : initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
          ),
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
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: widget.placeholder,
                            ),
                            initialValue: widget.value,
                            onChanged: (newValue) {
                              setState(() {
                                isValueChanged = newValue != initialValue;
                                currentValue = newValue;
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
      ],
    );
  }
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