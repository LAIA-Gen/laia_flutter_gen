// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:riverpod_custom_generator/src/model_visitor.dart';

class RiverpodCustomGenerator extends GeneratorForAnnotation<RiverpodGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    // TODO - go to openapi from baseURL and define the routes
    // final baseURL = annotation.read('baseURL').stringValue;
    var className = visitor.className;
    var classNameLowercase = className.toLowerCase();
    var classNamePlural = '${classNameLowercase}s';

    final buffer = StringBuffer();
    buffer.writeln('''
      final get${className}Provider = FutureProvider.autoDispose.family<$className, String>((ref, ${classNameLowercase}Id) async {
        final json = await http.get(Uri.parse('\$baseURL/$classNamePlural/\$${classNameLowercase}Id'));
        final jsonData = jsonDecode(json.body);
        return $className.fromJson(jsonData);
      });

      final create${className}Provider = FutureProvider.autoDispose.family<void, $className>((ref, ${classNameLowercase}Instance) async {
        final response = await http.post(
          Uri.parse('\$baseURL/$classNamePlural'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(${classNameLowercase}Instance.toJson()),
        );
        if (response.statusCode != 201) {
          throw Exception('Failed to create $className');
        }
      });

      final update${className}Provider = FutureProvider.autoDispose.family<void, $className>((ref, ${classNameLowercase}Instance) async {
        final response = await http.put(
          Uri.parse('\$baseURL/$classNamePlural/\${${classNameLowercase}Instance.id}'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(${classNameLowercase}Instance.toJson()),
        );
        if (response.statusCode != 200) {
          throw Exception('Failed to update $className');
        }
      });

      final delete${className}Provider = FutureProvider.autoDispose.family<void, int>((ref, ${classNameLowercase}Id) async {
        final response = await http.delete(
          Uri.parse('\$baseURL/$classNamePlural/\$${classNameLowercase}Id'),
        );
        if (response.statusCode != 204) {
          throw Exception('Failed to delete $className');
        }
      });

      class ${className}PaginationData {
        final List<$className> items;
        final int currentPage;
        final int maxPages;

        ${className}PaginationData({
          required this.items,
          required this.currentPage,
          required this.maxPages,
        });
      }

      final getAll${className}Provider = FutureProvider.autoDispose.family<${className}PaginationData, ${className}PaginationState>((ref, state) async {
        final fixedQuery = {
          if (state.orders.isNotEmpty) 'orders': state.orders,
          if (state.filters.isNotEmpty) 'filters': Map.from(state.filters)
          ..removeWhere((key, value) => value == null || value == ''),
        };

        final json = await http.post(Uri.parse(
          '\$baseURL/$classNamePlural/all?skip=\${state.pagination.item1}&limit=\${state.pagination.item2}'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(fixedQuery));
        final jsonData = jsonDecode(json.body);

        return ${className}PaginationData(
          items: (jsonData['items'] as List).map((data) => $className.fromJson(data)).toList(),
          currentPage: jsonData['current_page'],
          maxPages: jsonData['max_pages'],
        );
      });
''');

    return buffer.toString();
  }
}