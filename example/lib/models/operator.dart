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
import 'package:example/models/role.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:example/screens/home.dart';

part 'operator.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(auth: true)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation(defaultFields: ['name', 'address', 'identity', 'contactInformation', 'drones', 'flightplans'], )
@ElementWidgetGen(auth: true)
@CopyWith()
class Operator {
  @Field(editable: true, fieldDescription: "The address of the Drone Operator", fieldName: "Address", placeholder: "Enter the address of the Drone Operator")
  final Point? address;
  @Field(editable: true, fieldDescription: "Contact Information of the Operator", fieldName: "Contact Information", placeholder: "Provide Contact Information for the Operator")
  final String? contactInformation;
  @Field(editable: true, fieldDescription: "These are the Drones of the Operator", fieldName: "Drones", placeholder: "List the Drones operated by this Operator", relation: "Drone")
  final List<String>? drones;
  @Field(fieldName: 'email')
  final String email;
  @Field(editable: true, fieldDescription: "These are the Flightplans of the Operator", fieldName: "FlightPlans", placeholder: "List the Flightplans operated by this Operator", relation: "FlightPlan")
  final List<String>? flightplans;
  @Field(fieldName: 'id')
  final String? id;
  @Field(editable: true, fieldDescription: "This is the Identity of the Operator", fieldName: "Identity", placeholder: "Enter the Identity of the Operator")
  final String? identity;
  @Field(editable: true, fieldDescription: "This is the name of the Drone Operator", fieldName: "Name", placeholder: "Write the Name of the Drone Operator")
  final String name;
  @Field(fieldName: 'password')
  final String password;
  @Field(relation: "Role")
  final List<String>? roles;

  Operator({
    this.address,
    this.contactInformation,
    this.drones,
    required this.email,
    this.flightplans,
    this.id,
    this.identity,
    required this.name,
    required this.password,
    this.roles
  });

  factory Operator.fromJson(Map<String, dynamic> json) => _$OperatorFromJson(json);

  Map<String, dynamic> toJson() => _$OperatorToJson(this);
}
