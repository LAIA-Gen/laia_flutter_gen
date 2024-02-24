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
import 'package:example/models/customer.dart';

part 'shoe.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(baseURL)
@HomeWidgetElementGenAnnotation()
@ListWidgetGenAnnotation()
@elementWidgetGen
@CopyWith()
class Shoe {
  @Field(fieldName: 'brand')
  final String brand;
  @Field(relation: 'Customer')
  final String customerId;
  @Field(fieldName: 'id')
  final String id;
  @Field(fieldName: 'name')
  final String name;
  @Field(fieldName: 'price')
  final double price;
  @Field(fieldName: 'size')
  final double size;

  Shoe({
    required this.brand,
    required this.customerId,
    required this.id,
    required this.name,
    required this.price,
    required this.size
  });

  factory Shoe.fromJson(Map<String, dynamic> json) => _$ShoeFromJson(json);

  Map<String, dynamic> toJson() => _$ShoeToJson(this);
}