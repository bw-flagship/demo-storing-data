import '../objectbox.g.dart';
import 'person.dart';

class ObjectboxService {
  late Box<Person> box;
  Future<void> init() async {
    final store = await openStore();
    box = store.box<Person>();
  }

  Future<int> getOlderThan40Count() async {
    return box.query(Person_.age.greaterThan(40)).build().count();
  }

  Future<int> getYoungerThan40Count() async {
    return box.query(Person_.age.lessThan(40)).build().count();
  }

  void write(List<Person> persons) {
    box.putMany(persons);
  }
}
