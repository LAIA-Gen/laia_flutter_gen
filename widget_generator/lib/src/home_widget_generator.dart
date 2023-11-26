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
          int crossAxisCount = _isMobile() ? 3 : 5;

  return GridView.count(
      primary: false,
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      children: const [''');
    for (String line in lines) {
      String widgetName = line.trim();
      buffer.writeln('$widgetName(),');
    }
    buffer.writeln('''
              ],
    );
}

bool _isMobile() {
  return (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);
}
        ''');

    return buffer.toString();
  }
}