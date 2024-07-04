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
      updatePath = "/$classNameLowercase/\${${classNameLowercase}Instance['id']}";
    } else {
      updatePath = updatePath.replaceAll('{element_id}', "\${${classNameLowercase}Instance['id']}");
    }
    if (createPath == '') {
      createPath = '/$classNameLowercase';
    }
    if (getAllPath == '') {
      getAllPath = '/$classNamePlural';
    }

    final buffer = StringBuffer();
    buffer.writeln('''
      final get${className}Provider = FutureProvider.autoDispose.family<$className, String>((ref, ${classNameLowercase}Id) async {
        final headers = await getHeaders();
        final json = await http.get(Uri.parse('\$baseURL$getPath'), headers: headers);
        final jsonData = jsonDecode(json.body);
        return $className.fromJson(jsonData);
      });

      final create${className}Provider = FutureProvider.autoDispose.family<void, Tuple2<$className, BuildContext>>((ref, tuple) async {
        final headers = await getHeaders();
        $className ${classNameLowercase}Instance = tuple.item1;
        BuildContext context = tuple.item2;

        final response = await http.post(
          Uri.parse('\$baseURL$createPath'),
          headers: headers,
          body: jsonEncode(${classNameLowercase}Instance.toJson()),
        );
        if (response.statusCode != 200) {
          CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
        } else {
          CustomSnackBar.show(context, '$className created successfully');
        }
      });

      final update${className}Provider = FutureProvider.autoDispose.family<void, Tuple2<Map<String,dynamic>, BuildContext>>((ref, tuple) async {
        final headers = await getHeaders();
        Map<String,dynamic> ${classNameLowercase}Instance = tuple.item1;
        BuildContext context = tuple.item2;

        final response = await http.put(
          Uri.parse('\$baseURL$updatePath'),
          headers: headers,
          body: jsonEncode(${classNameLowercase}Instance),
        );
        if (response.statusCode != 200) {
          CustomSnackBar.show(context, jsonDecode(response.body)['detail']);
        } else {
          CustomSnackBar.show(context, '$className updated successfully');
        }
      });

      final delete${className}Provider = FutureProvider.autoDispose.family<void, String>((ref, ${classNameLowercase}Id) async {
        final headers = await getHeaders();
        final response = await http.delete(
          Uri.parse('\$baseURL$deletePath'),
          headers: headers
        );
        if (response.statusCode != 200) {
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
        final headers = await getHeaders();
        final fixedQuery = {
          if (state.orders.isNotEmpty) 'orders': state.orders,
          if (state.filters.isNotEmpty) 'filters': Map.from(state.filters)
          ..removeWhere((key, value) => value == null || value == ''),
        };

        final json = await http.post(Uri.parse(
          '\$baseURL$getAllPath?skip=\${state.pagination.item1}&limit=\${state.pagination.item2}'),
          headers: headers,
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
  final String email;
  final String password;

  Auth({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class AuthResult {
  final bool success;
  final String? errorMessage;
  final $className? $classNameLowercase;

  AuthResult(this.success, {this.errorMessage, this.$classNameLowercase});
}

final login${className}Provider = FutureProvider.autoDispose.family<AuthResult, Auth>((ref, auth) async {
  final response = await http.post(
    Uri.parse('\$baseURL/auth/login/$classNameLowercase/'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(auth.toJson()),
  );
  if (response.statusCode != 200) {
    return AuthResult(false, errorMessage: 'Incorrect email or password.');
  }

  final responseData = jsonDecode(response.body);
  final token = responseData['token'];

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);

  return AuthResult(true, $classNameLowercase: $className.fromJson(responseData['user']));
});

final register${className}Provider = FutureProvider.autoDispose.family<AuthResult, $className>((ref, $classNameLowercase) async {
  final response = await http.post(
    Uri.parse('\$baseURL/auth/register/$classNameLowercase/'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode($classNameLowercase.toJson()),
  );
  if (response.statusCode != 200) {
    return AuthResult(false, errorMessage: jsonDecode(response.body)['detail']);
  }

  final responseData = jsonDecode(response.body);
  final token = responseData['token'];

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);

  return AuthResult(true, $classNameLowercase: $className.fromJson(responseData['user']));
});

final verifyToken${className}Provider = FutureProvider.autoDispose<bool>((ref) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      return false;
    }

    final response = await http.get(
      Uri.parse('\$baseURL/auth/verify/$classNameLowercase/\$token'),
      headers: {'Authorization': 'Bearer \$token'},
    );

    if (response.statusCode == 200) {
      return true; 
    } else {
      return false;
    }
  } catch (e) {
    return false; 
  }
});
''');
    }

    return buffer.toString();
  }
}