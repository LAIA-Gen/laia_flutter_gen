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

part 'flightplanroute.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(baseURL)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation(defaultFields: ['drone_id', 'user_id', 'start_time', 'end_time', 'route'])
@elementWidgetGen
@CopyWith()
class FlightPlanRoute {
  @Field(editable: false, fieldName: 'Id')
  final String id;
  @Field(fieldName: 'Drone')
  final String drone_id;
  @Field(fieldName: 'User')
  final String user_id;
  @Field(fieldName: 'Departure time')
  final DateTime start_time;
  @Field(fieldName: 'Arrival time')
  final DateTime end_time;
  @Field(fieldName: 'Route')
  final List<Map<String, dynamic>> route;

  FlightPlanRoute({
    required this.id,
    required this.drone_id,
    required this.user_id,
    required this.start_time,
    required this.end_time,
    required this.route,
  });

  factory FlightPlanRoute.fromJson(Map<String, dynamic> json) => _$FlightPlanRouteFromJson(json);

  Map<String, dynamic> toJson() => _$FlightPlanRouteToJson(this);
}