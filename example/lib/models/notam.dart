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

part 'notam.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(auth: false)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation(defaultFields: ['name', 'description', 'type', 'start_date', 'end_date', 'issuing_authority', 'status', 'reference', 'area'], )
@ElementWidgetGen(defaultFieldsDetail: [['name', '50'], ['description', '50'], ['type', '30'], ['start_date', '30'], ['end_date', '10'], ['issuing_authority'], ['status'], ['reference', '50'], ['area', '50']], auth: false)
@CopyWith()
class NOTAM {
  @Field(editable: true, fieldDescription: "Geographical Area of the NOTAM", fieldName: "Area", placeholder: "Define the Area for the NOTAM")
  final Polygon area;
  @Field(editable: true, fieldDescription: "This is the NOTAM Description", fieldName: "Description", placeholder: "Write the NOTAM Description")
  final String? description;
  @Field(editable: true, fieldDescription: "End Date of the NOTAM", fieldName: "End Date", placeholder: "Select the End Date")
  final DateTime end_date;
  @Field(fieldName: 'id')
  final String? id;
  @Field(editable: true, fieldDescription: "Authority issuing the NOTAM", fieldName: "Issuing Authority", placeholder: "Specify the Issuing Authority")
  final String? issuing_authority;
  @Field(editable: true, fieldDescription: "This is the NOTAM Name", fieldName: "Name", placeholder: "Write the NOTAM Name")
  final String name;
  @Field(editable: true, fieldDescription: "Reference information for the NOTAM", fieldName: "Reference", placeholder: "Provide a Reference")
  final String? reference;
  @Field(editable: true, fieldDescription: "Start Date of the NOTAM", fieldName: "Start Date", placeholder: "Select the Start Date")
  final DateTime start_date;
  @Field(editable: true, fieldDescription: "Status of the NOTAM", fieldName: "Status", placeholder: "Specify the NOTAM Status")
  final String? status;
  @Field(editable: true, fieldDescription: "Type of the NOTAM", fieldName: "Type", placeholder: "Specify the NOTAM Type")
  final String? type;

  NOTAM({
    required this.area,
    this.description,
    required this.end_date,
    this.id,
    this.issuing_authority,
    required this.name,
    this.reference,
    required this.start_date,
    this.status,
    this.type
  });

  factory NOTAM.fromJson(Map<String, dynamic> json) => _$NOTAMFromJson(json);

  Map<String, dynamic> toJson() => _$NOTAMToJson(this);
}
