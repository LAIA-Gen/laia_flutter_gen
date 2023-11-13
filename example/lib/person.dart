import 'package:annotations/annotations.dart';

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