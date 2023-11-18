import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:example/generic/generic_widgets.dart';

part 'person.g.dart';

@jsonGen
@elementWidgetGen
class Person {
  String name; 
  String lastName;
  bool isAdult;
  int age;

  Person(this.name, this.lastName, this.isAdult, this.age);
}