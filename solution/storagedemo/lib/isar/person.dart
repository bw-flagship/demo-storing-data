import 'package:isar/isar.dart';

part 'person.g.dart';

@Collection()
class Person {
  int id = Isar.autoIncrement;
  late String name;
  late int age;
}
