// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:widget_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class HomeWidgetElementGenerator extends GeneratorForAnnotation<HomeWidgetElementGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element, 
    ConstantReader annotation, 
    BuildStep buildStep,
  ) {
    final buffer = StringBuffer();
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    buffer.writeln('class ${visitor.className}HomeWidget extends StatelessWidget {');

    buffer.writeln('const ${visitor.className}HomeWidget({super.key});');
    buffer.writeln('@override');
    buffer.writeln('Widget build(BuildContext context) {');
    buffer.writeln('''return Container(
      width: 100.0,
      height: 100.0,
      color: Colors.blue, // You can choose any color you like
      child: const Center(
        child: Text(
          "${visitor.className}",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}''');

    String filePath = '${Directory.current.path}/lib/home.txt';
    File file = File(filePath);

    String existingContent = file.existsSync() ? file.readAsStringSync() : '';

    if (!existingContent.contains("${visitor.className}HomeWidget")) {
      file.writeAsStringSync('${visitor.className}HomeWidget\n', mode: FileMode.append);
    }

    return buffer.toString();
  }
}