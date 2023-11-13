import 'package:annotations/annotations.dart';
import 'package:flutter/cupertino.dart';

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