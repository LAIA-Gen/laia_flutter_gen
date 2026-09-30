import 'dart:io';
import 'dart:convert';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:build/build.dart';
import 'package:laia_widget_generator/src/list_widget_generator.dart';
import 'package:laia_widget_generator/src/element_widget_generator.dart';
import 'package:laia_widget_generator/src/home_widget_element_generator.dart';
import 'package:laia_widget_generator/src/home_widget_generator.dart';
import 'generate_fixtures.dart' as support;

// Test double: this generator only reads the home index through BuildStep.
// ignore: subtype_of_sealed_class
class HomeBuildStep extends support.UnusedBuildStep {
  @override
  AssetId get inputId => AssetId('example', 'lib/screens/home.dart');
  @override
  Future<String> readAsString(AssetId id, {Encoding? encoding}) async =>
      'AuditLogHomeWidget\nLoginEventHomeWidget\nAuditLogUpdateHomeWidget\n';
}

Future<void> main() async {
  final resolved =
      await resolveFile2(path: File('test/support/models.dart').absolute.path);
  final library = (resolved as ResolvedUnitResult).libraryElement;
  final dir = Directory('test/generated')..createSync(recursive: true);
  for (final name in ['AuditLog', 'LoginEvent']) {
    final model = library.getClass(name)!;
    final step = support.UnusedBuildStep();
    final list = ListWidgetGenerator().generateForAnnotatedElement(
        model, support.annotation(model, 'ListWidgetGenAnnotation'), step);
    final element = ElementWidgetGenerator().generateForAnnotatedElement(
        model, support.annotation(model, 'ElementWidgetGen'), step);
    final menu = HomeWidgetElementGenerator().generateForAnnotatedElement(model,
        support.annotation(model, 'HomeWidgetElementGenAnnotation'), step);
    final emitted = '$list\n$element\n$menu';
    parseString(content: emitted, throwIfDiagnostics: true);
    File('${dir.path}/${name.toLowerCase()}_source.txt')
        .writeAsStringSync(emitted);
    final exposed = emitted
        .replaceAll('_LaiaAuditApi', 'AuditApi')
        .replaceAll('_LaiaAuditAccessDenied', 'AuditAccessDenied')
        .replaceAll('_LaiaAuditMenu', 'AuditMenu')
        .replaceAll('_LaiaAuditLogPage', 'AuditLogPage')
        .replaceAll('http.Client()', 'httpClientFactory()');
    File('${dir.path}/${name.toLowerCase()}_widgets.dart').writeAsStringSync('''
// Generated from the actual generators. Do not edit.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
const baseURL = 'https://example.invalid';
http.Client Function() httpClientFactory = http.Client.new;
Future<Map<String, String>> getHeaders() async => {'Authorization': 'Bearer test-token', 'Content-Type': 'application/json'};
$exposed
''');
  }
  final home = library.getClass('Home')!;
  final dashboard = await HomeWidgetGenerator().generateForAnnotatedElement(
      home,
      support.annotation(home, 'HomeWidgetGenAnnotation'),
      HomeBuildStep());
  parseString(content: dashboard, throwIfDiagnostics: true);
  File('${dir.path}/audit_home.txt').writeAsStringSync(dashboard);
}
