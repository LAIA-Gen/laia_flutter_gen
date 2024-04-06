import 'package:example/models/geometry.dart';
import 'package:example/screens/home.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

part 'person.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(auth: true, getPath: '/heytest/{element_id}')
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation()
@ElementWidgetGen(auth: true)
@CopyWith()
class Person {
  @Field(fieldName: "Description", fieldDescription: "This is the Description", editable: true, placeholder: "Write the Description")
  final String description;
  @Field(fieldName: 'email')
  final String email;
  @Field(fieldName: 'id')
  final String? id;
  @Field(fieldName: "Name", fieldDescription: "This is the Name", editable: true, placeholder: "Write the Name")
  final String name;
  @Field(fieldName: 'password')
  final String password;
  @Field(fieldName: 'roles')
  final List<String>? roles;

  Person({
    required this.description,
    required this.email,
    this.id,
    required this.name,
    required this.password,
    this.roles
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
