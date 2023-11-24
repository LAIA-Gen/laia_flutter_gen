import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:example/config/api.dart';
import 'package:example/generic/generic_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'drone.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(baseURL)
@HomeWidgetElementGenAnnotation('assets/drone.png')
@ListWidgetGenAnnotation(defaultFields: ['user_id', 'model', 'weight', 'max_altitude', 'max_speed'])
@elementWidgetGen
@CopyWith()
class Drone {
  @Field(editable: false)
  final String id;
  final String user_id;
  final String model;
  final double weight;
  final double max_altitude;
  final double max_speed;

  Drone({
    required this.id,
    required this.user_id,
    required this.model,
    required this.weight,
    required this.max_altitude,
    required this.max_speed,
  });

  factory Drone.fromJson(Map<String, dynamic> json) => _$DroneFromJson(json);

  Map<String, dynamic> toJson() => _$DroneToJson(this);
}