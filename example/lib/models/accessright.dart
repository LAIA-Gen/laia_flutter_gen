import 'package:example/models/geometry.dart';
import 'package:laia_annotations/laia_annotations.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:example/config/api.dart';
import 'package:example/generic/generic_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:example/config/styles.dart';
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:example/models/role.dart';

part 'accessright.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(auth: false)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation()
@ElementWidgetGen(auth: false)
@CopyWith()
class AccessRight {
  @Field(fieldName: 'name')
  final String name;
  @Field(fieldName: "Role", relation: "Role")
  final String role;
  @Field(fieldName: "Model", widget: "ModelsSelectableWidget")
  final String model;
  @Field(fieldName: "Operations Permitted", placeholder: "{'create': 1, 'read': 1, 'update': 0, 'delete': 0, 'search': 1}")
  final dynamic operations;
  @Field(fieldName: "Fields Creation", placeholder: "{'field_1': 1, 'field_2': 1, 'field_3': 0, ...}")
  final dynamic fields_create;
  @Field(fieldName: "Fields Edition", placeholder: "{'field_1': 1, 'field_2': 1, 'field_3': 0, ...}")
  final dynamic fields_edit;
  @Field(fieldName: "Fields Visibility", placeholder: "{'field_1': 1, 'field_2': 1, 'field_3': 0, ...}")
  final dynamic fields_visible;
  @Field(fieldName: 'id')
  final String id;

  AccessRight({
    required this.name,
    required this.role,
    required this.model,
    required this.operations,
    required this.fields_create,
    required this.fields_edit,
    required this.fields_visible,
    required this.id
  });

  factory AccessRight.fromJson(Map<String, dynamic> json) => _$AccessRightFromJson(json);

  Map<String, dynamic> toJson() => _$AccessRightToJson(this);
}
