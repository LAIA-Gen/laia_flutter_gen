library widget_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_generator/src/element_widget_generator.dart';
import 'package:widget_generator/src/generic_widgets_generator.dart';
import 'package:widget_generator/src/home_widget_element_generator.dart';
import 'package:widget_generator/src/home_widget_generator.dart';

Builder generateHomeWidgetElement(BuilderOptions options) => SharedPartBuilder(
    [HomeWidgetElementGenerator()], 
    'home_widget_element_generator',
  );

Builder generateHomeWidget(BuilderOptions options) => SharedPartBuilder(
    [HomeWidgetGenerator()], 
    'home_widget_generator',
  );

Builder generateElementWidget(BuilderOptions options) => SharedPartBuilder(
    [ElementWidgetGenerator()], 
    'element_widget_generator',
  );

Builder generateGenericWidgets(BuilderOptions options) => SharedPartBuilder(
    [GenericWidgetsGenerator()], 
    'generic_widgets_generator',
  );