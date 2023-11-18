library riverpod_custom_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:riverpod_custom_generator/src/riverpod_generator.dart';

Builder generateRiverpod(BuilderOptions options) => SharedPartBuilder(
    [RiverpodCustomGenerator()], 
    'riverpod_generator',
  );
