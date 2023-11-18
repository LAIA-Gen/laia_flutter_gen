library json_api_generator;

import 'package:build/build.dart';
import 'package:json_api_generator/src/json_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateJsonClass(BuilderOptions options) => SharedPartBuilder(
    [JsonGenerator()], 
    'json_generator',
  );
