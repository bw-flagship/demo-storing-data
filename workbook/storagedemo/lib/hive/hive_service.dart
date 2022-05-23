import 'package:hive_flutter/hive_flutter.dart';

import 'person.dart';

class HiveService {
  late Box<Person> box;

  bool _isInitialized = false;
  Future<void> init() async {
    if (!_isInitialized) {
      _isInitialized = true;
      await Hive.initFlutter();
      Hive.registerAdapter(PersonAdapter());
    }
    box = await Hive.openBox<Person>('testBox');
  }

  List<Person> read() {
    return box.values.toList();
  }

  Person? readById(String id) {
    return box.get(id);
  }

  Future<void> write(Person person) async {
    await box.put(person.id, person);
  }
}
