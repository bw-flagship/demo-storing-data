// ignore_for_file: avoid_print

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'person.dart';

class SqfliteService {
  Database? _db;
  Future<void> init() async {
    var databasesPath = await getDatabasesPath();
    // ignore: unused_local_variable
    String path = join(databasesPath, 'my_db.db');
    // await deleteDatabase(path);

    _db = await openDatabase(
      'my_db.db',
      version: 2,
      onCreate: (db, version) async {
        print("creating. version: $version");
        if (version == 1) {
          await _createTableV1(db);
        } else {
          await _createTableV2(db);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        print("upgrading from $oldVersion to $newVersion");
        if (oldVersion == 1) {
          await _updateTableV1ToV2(db);
        }
      },
      onDowngrade: (db, oldVersion, newVersion) async {
        print("Downgrade from $oldVersion to $newVersion");
        if (oldVersion == 2) {
          await _updateTableV2ToV1(db);
        }
      },
    );
  }

  Future<void> _createTableV1(Database db) async {
    await db.execute("""CREATE TABLE PERSONS (
      id TEXT PRIMARY KEY,
      name TEXT,
      age INTEGER
      )
      """);
  }

  Future<void> _updateTableV1ToV2(Database db) async {
    await db.execute("ALTER TABLE PERSONS RENAME COLUMN name TO nickname;");
  }

  Future<void> _updateTableV2ToV1(Database db) async {
    await db.execute("ALTER TABLE PERSONS RENAME COLUMN nickname to name;");
  }

  Future<void> _createTableV2(Database db) async {
    await db.execute("""CREATE TABLE PERSONS (
      id TEXT PRIMARY KEY,
      nickname TEXT,
      age INTEGER
      )
      """);
  }

  Future<int> getDbVersion() =>
      _db == null ? Future.value(-1) : _db!.getVersion();

  Future<void> write(Person person) async {
    await _db!.insert("PERSONS", {
      "id": person.id,
      "nickname": person.name,
      "age": person.age,
    });
  }

  Future<void> writeMany(List<Person> persons) async {
    final batch = _db!.batch();
    for (var person in persons) {
      batch.insert("PERSONS", {
        "id": person.id,
        "nickname": person.name,
        "age": person.age,
      });
    }
    await batch.commit();
  }

  Future<int?> getAgeSum() async {
    final data = await _db!.rawQuery("SELECT SUM(AGE) as AgeSum FROM PERSONS");
    return data[0]["AgeSum"] == null ? null : data[0]["AgeSum"] as int;
  }
}
