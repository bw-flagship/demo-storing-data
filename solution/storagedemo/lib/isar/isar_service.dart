import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'person.dart';

class IsarService {
  late Isar _isar;
  Future<void> init() async {
    final dir = await getApplicationSupportDirectory();
    _isar = await Isar.open(
      schemas: [PersonSchema],
      directory: dir.path,
      inspector: true,
    );
  }

  Future<int> getOlderThan40Count() async {
    return await _isar.persons.filter().ageGreaterThan(40).count();
  }

  Future<int> getYoungerThan40Count() async {
    return await _isar.persons.filter().ageLessThan(40).count();
  }

  Future<void> write(List<Person> persons) async {
    await _isar.writeTxn((isar) async => await _isar.persons.putAll(persons));
  }
}
