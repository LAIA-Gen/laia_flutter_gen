// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

class ElementWidgetGenerator extends GeneratorForAnnotation<ElementWidgetGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element, 
    ConstantReader annotation, 
    BuildStep buildStep
  ) {

    final buffer = StringBuffer();
    buffer.writeln('//HELLO THERE, THIS IS A WIDGET');
    return buffer.toString();
  }

}