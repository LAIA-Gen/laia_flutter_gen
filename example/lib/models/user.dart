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

part 'user.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(baseURL)
@HomeWidgetElementGenAnnotation('assets/user.png')
@ListWidgetGenAnnotation(defaultFields: ['name', 'email'])
@elementWidgetGen
@CopyWith()
class User {
  @Field(editable: false)
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}