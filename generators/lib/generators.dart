library generators;

import 'package:build/build.dart';
import 'package:generators/src/element_widget_generator.dart';
import 'package:generators/src/json_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateJsonClass(BuilderOptions options) => SharedPartBuilder(
    [JsonGenerator()], 
    'json_generator',
  );

Builder generateElementWidget(BuilderOptions options) => SharedPartBuilder(
    [ElementWidgetGenerator()], 
    'element_widget_generator',
  );