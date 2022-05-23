import 'package:flutter/material.dart';
import 'package:storagedemo/common/random_generator.dart';
import 'package:storagedemo/hive/hive_service.dart';

import 'person.dart';

class HiveDemo extends StatefulWidget {
  const HiveDemo({Key? key}) : super(key: key);

  @override
  State<HiveDemo> createState() => _HiveDemoState();
}

class _HiveDemoState extends State<HiveDemo> {
  final List<Person> persons = <Person>[];
  final service = HiveService();

  @override
  void initState() {
    service.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                service.write(
                  Person(RandomGenerator.getRandomString(10),
                      RandomGenerator.getRandomString(10), 30),
                );
              },
              child: const Text("Add Person"),
            ),
            ElevatedButton(
              onPressed: () {
                persons.clear();
                persons.addAll(service.read());
                setState(() {});
              },
              child: const Text("Read"),
            ),
            const Text("Current People:"),
            ...persons.map((person) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(person.name),
                    const SizedBox(width: 30),
                    Text(person.age.toString()),
                    IconButton(
                      onPressed: () {
                        person.age++;
                        service.write(person);
                        setState(() {});
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
