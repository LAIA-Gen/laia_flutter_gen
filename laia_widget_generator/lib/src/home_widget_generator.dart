// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:laia_annotations/laia_annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:laia_widget_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class HomeWidgetGenerator extends GeneratorForAnnotation<HomeWidgetGenAnnotation> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep
  ) async {
    final buffer = StringBuffer();
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    final homeTxtId = AssetId(buildStep.inputId.package, 'lib/home.txt');
    final content = await buildStep.readAsString(homeTxtId);
    final lines = content.split('\n');

    buffer.writeln("Widget dashboardWidget(BuildContext context) {");
    buffer.writeln('''
  return AppCardsGrid(
    items: [
''');

for (String line in lines) {
  final widgetName = line.trim();
  if (widgetName.isEmpty) continue;

  if (widgetName.contains('Update') || widgetName.contains('UpdateHomeWidget')) continue;

  final base = widgetName
      .replaceAll('HomeWidget', '')
      .replaceAll('Widget', '');

  final listViewName = '${base}ListView';

  buffer.writeln('''
      AppCardItem(
        title: '$base',
        icon: Icon(iconForModel('$base')),
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(pageBuilder: (_, __, ___) => $listViewName()),
          );
        },
      ),
''');
}

buffer.writeln('''
    ],
  );
}
''');


    buffer.writeln('''class DynamicLogInScreen extends StatelessWidget {
  final Map<String, StatefulWidget> widgetMap;

  DynamicLogInScreen({required this.widgetMap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LAIA_NEW_DESIGN'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgetMap.entries
              .map((entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => entry.value,
                          ),
                        );
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 32)),
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Styles.buttonPrimaryColorHover;
                          }
                          return Styles.buttonPrimaryColor;
                        }),
                      ),
                      child: Text(entry.key),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
        ''');

    return buffer.toString();
  }
}
