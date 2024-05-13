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
import 'package:example/models/flightplan.dart';

part 'dronestracking.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(auth: false)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation(defaultFields: ['name', 'droneId', 'flightplanId', 'coordinates', 'altitude', 'timestamp'], )
@ElementWidgetGen(defaultFieldsDetail: [['name'], ['droneId'], ['flightplanId'], ['coordinates'], ['altitude'], ['timestamp']], auth: false)
@CopyWith()
class DronesTracking {
  @Field(editable: true, fieldDescription: "Altitude of this position", fieldName: "Altitude", placeholder: "Enter Altitude")
  final double altitude;
  @Field(editable: true, fieldDescription: "This are the coordinates of the Drone", fieldName: "Coordinates", placeholder: "Add the coordinates of the Drone", uspaceMap: true)
  final Point coordinates;
  @Field(editable: true, fieldDescription: "This is the Drone", fieldName: "Drone", placeholder: "Select the Drone of this position", relation: "Drone")
  final String droneId;
  @Field(editable: true, fieldDescription: "This is the FlightPlan", fieldName: "FlightPlan", placeholder: "Select the FlightPlan of this position", relation: "FlightPlan")
  final String? flightplanId;
  @Field(fieldName: 'id')
  final String? id;
  @Field(editable: true, fieldDescription: "Name", fieldName: "Name", placeholder: "Name")
  final String name;
  @Field(editable: true, fieldDescription: "Timestamp of the Drone position", fieldName: "Timestamp", placeholder: "Select a Datetime")
  final DateTime timestamp;

  DronesTracking({
    required this.altitude,
    required this.coordinates,
    required this.droneId,
    this.flightplanId,
    this.id,
    required this.name,
    required this.timestamp
  });

  factory DronesTracking.fromJson(Map<String, dynamic> json) => _$DronesTrackingFromJson(json);

  Map<String, dynamic> toJson() => _$DronesTrackingToJson(this);
}
