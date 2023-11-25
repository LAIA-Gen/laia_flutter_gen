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
import 'package:example/models/user.dart';

part 'drone.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(baseURL)
@HomeWidgetElementGenAnnotation(icon: 'assets/drone.png')
@ListWidgetGenAnnotation(defaultFields: ['user_id', 'model', 'weight', 'max_altitude', 'max_speed'])
@elementWidgetGen
@CopyWith()
class Drone {
  @Field(editable: false, fieldName: 'Id')
  final String id;
  @Field(fieldName: 'User', relation: 'User')
  final String user_id;
  @Field(fieldName: 'Model')
  final String model;
  @Field(fieldName: 'Weight')
  final double weight;
  @Field(fieldName: 'Maximum altitude')
  final double max_altitude;
  @Field(fieldName: 'Maximum speed')
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