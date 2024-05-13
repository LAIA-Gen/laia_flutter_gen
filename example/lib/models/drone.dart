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
import 'package:example/generic/drone_widgets.dart';

part 'drone.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(auth: false)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation(defaultFields: ['name', 'model', 'capabilities', 'alerts'], )
@ElementWidgetGen(defaultFieldsDetail: [['name'], ['model'], ['capabilities'], ['alerts']], auth: false)
@CopyWith()
class Drone {
  @Field(fieldName: "Alerts", fieldDescription: "Drone's Alerts", editable: true, placeholder: "Drone's Alerts", widget: "droneAlertsWidget")
  final Map<String, dynamic>? alerts;
  @Field(editable: true, fieldDescription: "These are the Capabilities of the Drone", fieldName: "Capabilities", placeholder: "Describe the Capabilities of the Drone")
  final String? capabilities;
  @Field(fieldName: 'id')
  final String? id;
  @Field(editable: true, fieldDescription: "This is the Model of the Drone", fieldName: "Model", placeholder: "Enter the Model of the Drone")
  final String? model;
  @Field(editable: true, fieldDescription: "This is the Drone Name", fieldName: "Name", placeholder: "Write the Name of your Drone")
  final String name;

  Drone({
    this.alerts,
    this.capabilities,
    this.id,
    this.model,
    required this.name
  });

  factory Drone.fromJson(Map<String, dynamic> json) => _$DroneFromJson(json);

  Map<String, dynamic> toJson() => _$DroneToJson(this);
}
