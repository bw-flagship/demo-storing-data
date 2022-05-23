import 'package:objectbox/objectbox.dart';

@Entity()
class Person {
  late int id;
  late String name;
  late int age;
  Person();
}
