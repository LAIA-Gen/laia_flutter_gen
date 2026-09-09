import 'package:laia_annotations/laia_annotations.dart';

@ListWidgetGenAnnotation(
    pageSize: 2,
    defaultFields: ['name', 'roles.name', 'roles.rank', 'tags', 'validated'])
@RiverpodGenAnnotation()
class User {
  @Field(fieldName: 'Name')
  final String? name;
  @Field(relation: 'Role')
  final dynamic roles;
  @Field()
  final List<String>? tags;
  @Field()
  final bool? validated;
  final String? id;

  User({this.name, this.roles, this.tags, this.validated, this.id});
  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      roles: json['roles']);
}

class Role {
  final String? name;
  final int? rank;
  Role({this.name, this.rank});
}

@GenericWidgetsGenAnnotation()
class GenericWidgets {}

@ListWidgetGenAnnotation()
class Plain {
  @Field(fieldName: 'Display label')
  final String? value;
  Plain({this.value});
}
