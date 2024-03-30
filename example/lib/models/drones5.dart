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

part 'drones5.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(baseURL)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation()
@elementWidgetGen
@CopyWith()
class Drones5 {
  @Field(fieldName: 'description')
  final String? description;
  @Field(fieldName: 'flightplan')
  final MultiLineString flightplan;
  @Field(fieldName: 'id')
  final String? id;
  @Field(fieldName: 'name')
  final String name;

  Drones5({
    required this.description,
    required this.flightplan,
    required this.id,
    required this.name
  });

  factory Drones5.fromJson(Map<String, dynamic> json) => _$Drones5FromJson(json);

  Map<String, dynamic> toJson() => _$Drones5ToJson(this);
}
