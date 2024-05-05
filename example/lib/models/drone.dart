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
import 'package:example/models/flightplan.dart';

part 'drone.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(auth: false)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation(defaultFields: ['name', 'description', 'flightplans'], )
@ElementWidgetGen(auth: false)
@CopyWith()
class Drone {
  @Field(editable: true, fieldDescription: "This is the Drone Description", fieldName: "Description", placeholder: "Write short description of your Drone")
  final String? description;
  @Field(editable: true, fieldDescription: "These are the Drone's FlightPlans", fieldName: "FlightPlans", placeholder: "List the Drone's FlightPlans", relation: "FlightPlan")
  final List<String> flightplans;
  @Field(fieldName: 'id')
  final String? id;
  @Field(editable: true, fieldDescription: "This is the Drone Name", fieldName: "Name", placeholder: "Write the Name of your Drone")
  final String name;

  Drone({
    this.description,
    required this.flightplans,
    this.id,
    required this.name
  });

  factory Drone.fromJson(Map<String, dynamic> json) => _$DroneFromJson(json);

  Map<String, dynamic> toJson() => _$DroneToJson(this);
}
