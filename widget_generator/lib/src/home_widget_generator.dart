// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:widget_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class HomeWidgetGenerator extends GeneratorForAnnotation<HomeWidgetGenAnnotation> {
  @override
  generateForAnnotatedElement(
    Element element, 
    ConstantReader annotation, 
    BuildStep buildStep
  ) {
    final buffer = StringBuffer();
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    String filePath = '${Directory.current.path}/lib/home.txt';
    File file = File(filePath);

    List<String> lines = file.readAsLinesSync();

    buffer.writeln("Widget dashboardWidget() {");
    buffer.writeln('''
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
            ),
            child: const Column(
              children: [''');
    for (String line in lines) {
      String widgetName = line.trim();
      buffer.writeln('$widgetName(),');
    }
    buffer.writeln('''
              ],
            ),
          );
        }
        ''');

    return buffer.toString();
  }
}