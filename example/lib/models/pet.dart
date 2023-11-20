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

part 'pet.g.dart';

@JsonSerializable()
@RiverpodGenAnnotation(baseURL)
@HomeWidgetElementGenAnnotation('assets/pet.png')
@ListWidgetGenAnnotation()
@elementWidgetGen
@CopyWith()
class Pet {
  final int id;
  final String name; 
  final String animalType;
  final double weight;
  final DateTime date;
  final int? ownerId;

  Pet({required this.id, required this.name, required this.animalType, required this.weight, required this.date, this.ownerId});

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);
}