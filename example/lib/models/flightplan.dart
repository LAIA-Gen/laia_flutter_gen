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

part 'flightplan.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(auth: false)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation(defaultFields: ['name', 'date', 'mission_details', 'route'], )
@ElementWidgetGen(auth: false)
@CopyWith()
class FlightPlan {
  @Field(editable: true, fieldDescription: "Departure Datetime of the FlightPlan", fieldName: "Flight Date", placeholder: "Select a Datetime")
  final DateTime? date;
  @Field(fieldName: 'id')
  final String? id;
  @Field(editable: true, fieldDescription: "These are the important details for the mission", fieldName: "Mission Details", placeholder: "Write the mission details here")
  final String? mission_details;
  @Field(editable: true, fieldDescription: "This is the Name of the FlightPlan", fieldName: "Name", placeholder: "Write the Name of this FlightPlan")
  final String name;
  @Field(editable: true, fieldDescription: "This is Route of the FlightPlan", fieldName: "Route", placeholder: "Add the coordinates for the Route", uspaceMap: true)
  final LineString? route;

  FlightPlan({
    this.date,
    this.id,
    this.mission_details,
    required this.name,
    this.route
  });

  factory FlightPlan.fromJson(Map<String, dynamic> json) => _$FlightPlanFromJson(json);

  Map<String, dynamic> toJson() => _$FlightPlanToJson(this);
}
