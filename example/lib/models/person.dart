import 'package:annotations/annotations.dart';
import 'package:example/config/api.dart';
import 'package:flutter/material.dart';
import 'package:example/generic/generic_widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tuple/tuple.dart';

part 'person.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(baseURL)
@HomeWidgetElementGenAnnotation('assets/person.png')
@ListWidgetGenAnnotation(defaultFields: ['name', 'surname'])
@elementWidgetGen
@CopyWith()
class Person {
  @Field(editable: false, fieldDescription: 'This is another description lel')
  final int id;
  final String name; 
  final String surname;
  @Field(placeholder: 'this is a diferent placeholder yey')
  final String address;
  @Field(fieldDescription: 'hey yo')
  final DateTime date;

  Person({required this.id, required this.name, required this.surname, required this.address, required this.date});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}