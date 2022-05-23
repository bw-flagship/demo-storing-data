import 'person.dart';

class HiveService {
  Future<void> init() async {}

  List<Person> read() {
    throw UnimplementedError();
  }

  Person? readById(String id) {
    throw UnimplementedError();
  }

  Future<void> write(Person person) async {
    throw UnimplementedError();
  }
}
