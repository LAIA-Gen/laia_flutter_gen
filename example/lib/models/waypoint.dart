import 'package:annotations/annotations.dart';
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

part 'waypoint.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(baseURL)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation(defaultFields: ['name', 'description', 'coordinates'])
@elementWidgetGen
@CopyWith()
class Waypoint {
  @Field(editable: false, fieldName: 'Id')
  final String id;
  @Field(fieldName: 'Name')
  final String name;
  @Field(fieldName: 'Description')
  final String description;
  @Field(fieldName: 'Coordinates')
  final Map<String, dynamic> coordinates;

  Waypoint({required this.id, required this.name, required this.description, required this.coordinates});

  factory Waypoint.fromJson(Map<String, dynamic> json) => _$WaypointFromJson(json);

  Map<String, dynamic> toJson() => _$WaypointToJson(this);
}