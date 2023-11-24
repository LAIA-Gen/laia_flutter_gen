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

part 'flight_plan.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(baseURL)
@HomeWidgetElementGenAnnotation('assets/flight_plan.png')
@ListWidgetGenAnnotation(defaultFields: ['drone_id', 'user_id', 'start_time', 'end_time', 'route'])
@elementWidgetGen
@CopyWith()
class FlightPlan {
  @Field(editable: false)
  final String id;
  final String drone_id;
  final String user_id;
  final DateTime start_time;
  final DateTime end_time;
  final List<String> route;

  FlightPlan({
    required this.id,
    required this.drone_id,
    required this.user_id,
    required this.start_time,
    required this.end_time,
    required this.route,
  });

  factory FlightPlan.fromJson(Map<String, dynamic> json) => _$FlightPlanFromJson(json);

  Map<String, dynamic> toJson() => _$FlightPlanToJson(this);
}