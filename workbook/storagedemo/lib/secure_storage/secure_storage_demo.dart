import 'package:flutter/material.dart';

import '../common/random_generator.dart';
import 'secure_storage_service.dart';

class SecureStorageDemo extends StatefulWidget {
  const SecureStorageDemo({Key? key}) : super(key: key);

  @override
  State<SecureStorageDemo> createState() => _SecureStorageDemoState();
}

class _SecureStorageDemoState extends State<SecureStorageDemo> {
  String? value;

  final storage = SecureStorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secure Storage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await storage.write(
                  "value",
                  RandomGenerator.getRandomString(10),
                );
              },
              child: const Text("Other value"),
            ),
            ElevatedButton(
              onPressed: () async {
                value = await storage.read("value");
                setState(() {});
              },
              child: const Text("Read"),
            ),
            const Text("Current value:"),
            Text(value ?? "null")
          ],
        ),
      ),
    );
  }
}
