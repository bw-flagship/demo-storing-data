import 'package:hive_flutter/hive_flutter.dart';
part 'person.g.dart';

@HiveType(typeId: 0)
class Person {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int age;
  Person(this.id, this.name, this.age);
}
