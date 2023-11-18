import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:example/generic/generic_widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@JsonSerializable()
@riverpodGen
@elementWidgetGen
@homeWidgetElement
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