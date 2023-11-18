library riverpod_generator;

import 'package:build/build.dart';
import 'package:riverpod_generator/src/riverpod_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateRiverpod(BuilderOptions options) => SharedPartBuilder(
    [RiverpodGenerator()], 
    'riverpod_generator',
  );
