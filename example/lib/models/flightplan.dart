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
import 'package:example/models/drone.dart';

part 'flightplan.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(auth: false)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation(defaultFields: ['name', 'mission_details', 'route', 'departure_time', 'arrival_time', 'droneId', 'approved'], )
@ElementWidgetGen(defaultFieldsDetail: [['name'], ['mission_details'], ['departure_time'], ['arrival_time'], ['droneId'], ['approved'], ['route']], auth: false)
@CopyWith()
class FlightPlan {
  @Field(editable: true, fieldDescription: "Status of the Flightplan approval", fieldName: "Approved", placeholder: "Toggle the Approving status")
  final bool? approved;
  @Field(editable: true, fieldDescription: "Arrival Datetime of the FlightPlan", fieldName: "Arrival Time", placeholder: "Select a Datetime")
  final DateTime? arrival_time;
  @Field(editable: true, fieldDescription: "Departure Datetime of the FlightPlan", fieldName: "Departure Time", placeholder: "Select a Datetime")
  final DateTime? departure_time;
  @Field(editable: true, fieldDescription: "This is the Drone", fieldName: "Drone", placeholder: "Select the Drone of this FlightPlan", relation: "Drone")
  final String? droneId;
  @Field(fieldName: 'id')
  final String? id;
  @Field(editable: true, fieldDescription: "Mission details of the Flight Plan", fieldName: "Mission Details", placeholder: "Provide the mission details")
  final String? mission_details;
  @Field(editable: true, fieldDescription: "This is the name of the Flight Plan", fieldName: "Name", placeholder: "Write the Name of the Flight Plan")
  final String name;
  @Field(editable: true, fieldDescription: "This is Route of the FlightPlan", fieldName: "Route", placeholder: "Add the coordinates for the Route", uspaceMap: true)
  final LineString? route;

  FlightPlan({
    this.approved,
    this.arrival_time,
    this.departure_time,
    this.droneId,
    this.id,
    this.mission_details,
    required this.name,
    this.route
  });

  factory FlightPlan.fromJson(Map<String, dynamic> json) => _$FlightPlanFromJson(json);

  Map<String, dynamic> toJson() => _$FlightPlanToJson(this);
}
