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

part 'pet.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation()
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation()
@ElementWidgetGen()
@CopyWith()
class Pet {
  @Field(fieldName: "Age", fieldDescription: "This is the Age", editable: true, placeholder: "Write the Age")
  final String? age;
  @Field(fieldName: "Description", fieldDescription: "This is the Description", editable: true, placeholder: "Write the Description")
  final String description;
  @Field(fieldName: 'id')
  final String? id;
  @Field(fieldName: "Name", fieldDescription: "This is the Name", editable: true, placeholder: "Write the Name")
  final String name;
  @Field(fieldName: "Owner", fieldDescription: "This is the Owner", editable: true, placeholder: "Write the Owner", relation: "Person")
  final String? ownerid;

  Pet({
    required this.age,
    required this.description,
    required this.id,
    required this.name,
    required this.ownerid
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);
}
