library widget_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_generator/src/element_widget_generator.dart';

Builder generateElementWidget(BuilderOptions options) => SharedPartBuilder(
    [ElementWidgetGenerator()], 
    'element_widget_generator',
  );