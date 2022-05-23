import 'package:flutter/material.dart';
import 'package:storagedemo/common/random_generator.dart';
import 'package:storagedemo/objectbox/objectbox_service.dart';

import 'person.dart';

class ObjectboxDemo extends StatefulWidget {
  const ObjectboxDemo({Key? key}) : super(key: key);

  @override
  State<ObjectboxDemo> createState() => _ObjectboxDemoState();
}

class _ObjectboxDemoState extends State<ObjectboxDemo> {
  final service = ObjectboxService();

  @override
  void initState() {
    service.init();
    super.initState();
  }

  int? countBelow40;
  int? countAbove40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Objectbox"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                final persons = <Person>[];
                for (var i = 0; i < 100000; i++) {
                  persons.add(Person()
                    ..id = 0
                    ..age = RandomGenerator.getRandomInt()
                    ..name = RandomGenerator.getRandomString(10));
                }
                service.write(persons);
              },
              child: const Text("Insert 100.000 randoms"),
            ),
            ElevatedButton(
              onPressed: () async {
                countAbove40 = await service.getOlderThan40Count();
                countBelow40 = await service.getYoungerThan40Count();
                setState(() {});
              },
              child: const Text("Read"),
            ),
            const Text("Above 40:"),
            Text(countAbove40?.toString() ?? "null"),
            const Text("Below 40:"),
            Text(countBelow40?.toString() ?? "null"),
          ],
        ),
      ),
    );
  }
}
