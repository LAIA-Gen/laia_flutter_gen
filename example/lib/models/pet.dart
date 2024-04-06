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
import 'package:example/models/person.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:example/screens/home.dart';

part 'pet.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(auth: true)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation()
@ElementWidgetGen(auth: true)
@CopyWith()
class Pet {
  @Field(editable: true, fieldDescription: "This is the Age", fieldName: "Age", placeholder: "Write the Age")
  final String? age;
  @Field(editable: true, fieldDescription: "This is the Description", fieldName: "Description", placeholder: "Write the Description")
  final String description;
  @Field(fieldName: 'email')
  final String email;
  @Field(fieldName: 'id')
  final String? id;
  @Field(editable: true, fieldDescription: "This is the Name", fieldName: "Name", placeholder: "Write the Name")
  final String name;
  @Field(editable: true, fieldDescription: "This is the Owner", fieldName: "Owner", placeholder: "Write the Owner", relation: "Person")
  final String? ownerid;
  @Field(fieldName: 'password')
  final String password;
  @Field(fieldName: 'roles')
  final List<String>? roles;

  Pet({
    this.age,
    required this.description,
    required this.email,
    this.id,
    required this.name,
    this.ownerid,
    required this.password,
    this.roles
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);
}
