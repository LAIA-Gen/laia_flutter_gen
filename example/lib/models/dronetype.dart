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

part 'dronetype.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(auth: false)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation(defaultFields: ['name', 'description'], )
@ElementWidgetGen(auth: false)
@CopyWith()
class DroneType {
  @Field(editable: true, fieldDescription: "Description of the drone type", fieldName: "Description", placeholder: "Provide a description of the drone type")
  final String? description;
  @Field(fieldName: 'id')
  final String? id;
  @Field(editable: true, fieldDescription: "This is the name of the drone type", fieldName: "Name", placeholder: "Enter the name of the drone type")
  final String? name;

  DroneType({
    this.description,
    this.id,
    this.name
  });

  factory DroneType.fromJson(Map<String, dynamic> json) => _$DroneTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DroneTypeToJson(this);
}
