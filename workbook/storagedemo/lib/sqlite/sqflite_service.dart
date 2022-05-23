// ignore_for_file: avoid_print

import 'person.dart';

class SqfliteService {
  Future<void> init() async {}

  Future<int> getDbVersion() => throw UnimplementedError();

  Future<void> write(Person person) async {}

  Future<void> writeMany(List<Person> persons) async {
    throw UnimplementedError();
  }

  Future<int?> getAgeSum() async {
    throw UnimplementedError();
  }
}
