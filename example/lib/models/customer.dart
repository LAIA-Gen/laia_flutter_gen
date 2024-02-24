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
import 'package:flutter_typeahead/flutter_typeahead.dart';

part 'customer.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(baseURL)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation()
@elementWidgetGen
@CopyWith()
class Customer {
  @Field(fieldName: 'email')
  final String email;
  @Field(fieldName: 'id')
  final String id;
  @Field(fieldName: 'name')
  final String name;

  Customer({
    required this.email,
    required this.id,
    required this.name
  });

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
