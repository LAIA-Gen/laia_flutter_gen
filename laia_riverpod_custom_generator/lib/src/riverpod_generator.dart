// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:laia_annotations/laia_annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:laia_riverpod_custom_generator/src/model_visitor.dart';

class RiverpodCustomGenerator extends GeneratorForAnnotation<RiverpodGenAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    var getPath = annotation.read('getPath').stringValue;
    var createPath = annotation.read('createPath').stringValue;
    var updatePath = annotation.read('updatePath').stringValue;
    var deletePath = annotation.read('deletePath').stringValue;
    var getAllPath = annotation.read('getAllPath').stringValue;
    final auth = annotation.read('auth').boolValue;
  
    var className = visitor.className;
    var classNameLowercase = className.toLowerCase();
    var classNamePlural = '${classNameLowercase}s';

    if (getPath == '') {
      getPath = '/$classNameLowercase/\$${classNameLowercase}Id';
    } else {
      getPath = getPath.replaceAll('{element_id}', '\$${classNameLowercase}Id');
    }
    if (deletePath == '') {
      deletePath = '/$classNameLowercase/\$${classNameLowercase}Id';
    } else {
      deletePath = deletePath.replaceAll('{element_id}', '\$${classNameLowercase}Id');
    }
    if (updatePath == '') {
      updatePath = '/$classNameLowercase/\$${classNameLowercase}Id';
    } else {
      updatePath = updatePath.replaceAll('{element_id}', '\$${classNameLowercase}Id');
    }
    if (createPath == '') {
      createPath = '/$classNameLowercase';
    }
    if (getAllPath == '') {
      createPath = '/$classNamePlural';
    }

    final buffer = StringBuffer();
    buffer.writeln('''
      final get${className}Provider = FutureProvider.autoDispose.family<$className, String>((ref, ${classNameLowercase}Id) async {
        final json = await http.get(Uri.parse('\$baseURL/$classNameLowercase/\$${classNameLowercase}Id'));
        final jsonData = jsonDecode(json.body);
        return $className.fromJson(jsonData);
      });

      final create${className}Provider = FutureProvider.autoDispose.family<void, $className>((ref, ${classNameLowercase}Instance) async {
        final response = await http.post(
          Uri.parse('\$baseURL/$classNameLowercase'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(${classNameLowercase}Instance.toJson()),
        );
        if (response.statusCode != 201) {
          throw Exception('Failed to create $className');
        }
      });

      final update${className}Provider = FutureProvider.autoDispose.family<void, $className>((ref, ${classNameLowercase}Instance) async {
        final response = await http.put(
          Uri.parse('\$baseURL/$classNameLowercase/\${${classNameLowercase}Instance.id}'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(${classNameLowercase}Instance.toJson()),
        );
        if (response.statusCode != 200) {
          throw Exception('Failed to update $className');
        }
      });

      final delete${className}Provider = FutureProvider.autoDispose.family<void, int>((ref, ${classNameLowercase}Id) async {
        final response = await http.delete(
          Uri.parse('\$baseURL/$classNameLowercase/\$${classNameLowercase}Id'),
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
          '\$baseURL/$classNamePlural?skip=\${state.pagination.item1}&limit=\${state.pagination.item2}'),
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
    
    if (auth) {
      buffer.writeln('''
class Auth {
  final String username;
  final String password;

  Auth({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}

final login${className}Provider = FutureProvider.autoDispose.family<$className, Auth>((ref, auth) async {
  final response = await http.post(
    Uri.parse('\$baseURL/auth/login/$classNameLowercase/'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(auth.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to login');
  }

  final responseData = jsonDecode(response.body);
  final token = responseData['token'];

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);

  return responseData['user'];
});

final register${className}Provider = FutureProvider.autoDispose.family<$className, $className>((ref, $classNameLowercase) async {
  final response = await http.post(
    Uri.parse('\$baseURL/auth/register/$classNameLowercase/'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode($classNameLowercase.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to register');
  }

  final responseData = jsonDecode(response.body);
  final token = responseData['token'];

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);

  return responseData['user'];
});
''');
    }

    return buffer.toString();
  }
}