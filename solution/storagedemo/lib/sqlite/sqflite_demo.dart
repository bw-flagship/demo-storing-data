import 'package:flutter/material.dart';
import 'package:storagedemo/common/random_generator.dart';
import 'package:storagedemo/sqlite/sqflite_service.dart';

import 'person.dart';

class SqfliteDemo extends StatefulWidget {
  const SqfliteDemo({Key? key}) : super(key: key);

  @override
  State<SqfliteDemo> createState() => _SqfliteDemoState();
}

class _SqfliteDemoState extends State<SqfliteDemo> {
  final service = SqfliteService();

  @override
  void initState() {
    service.init();

    super.initState();
  }

  int? ageSum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sqflite"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                service.write(
                  Person(RandomGenerator.getRandomString(10),
                      RandomGenerator.getRandomString(10), 30),
                );
              },
              child: const Text("Insert"),
            ),
            ElevatedButton(
              onPressed: () {
                final persons = <Person>[];
                for (var i = 0; i < 100000; i++) {
                  persons.add(
                    Person(
                      RandomGenerator.getRandomString(10),
                      RandomGenerator.getRandomString(10),
                      RandomGenerator.getRandomInt(),
                    ),
                  );
                }
                service.writeMany(persons);
              },
              child: const Text("Insert 100.000"),
            ),
            ElevatedButton(
              onPressed: () async {
                ageSum = await service.getAgeSum();
                setState(() {});
              },
              child: const Text("Read"),
            ),
            const Text("Current age sum:"),
            Text(ageSum?.toString() ?? "null"),
            const Text("Version:"),
            FutureBuilder<int>(
              builder: (context, snapshot) =>
                  Text(snapshot.data?.toString() ?? "?"),
              future: service.getDbVersion(),
            ),
          ],
        ),
      ),
    );
  }
}
