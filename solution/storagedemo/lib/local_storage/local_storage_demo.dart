import 'dart:io';

import 'package:flutter/material.dart';
import 'package:storagedemo/local_storage/local_storage_service.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocalStorageDemo extends StatefulWidget {
  const LocalStorageDemo({Key? key}) : super(key: key);

  @override
  State<LocalStorageDemo> createState() => _LocalStorageDemoState();
}

class _LocalStorageDemoState extends State<LocalStorageDemo> {
  final service = LocalStorageService();
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Storage"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final image =
                    await rootBundle.load("assets/images/bettercode_logo.png");

                await service.writeFile(image.buffer.asUint8List());
              },
              child: const Text("Save image"),
            ),
            ElevatedButton(
              onPressed: () async {
                final file = await service.getFile();
                setState(() {
                  image = file;
                });
              },
              child: const Text("Load from storage"),
            ),
            if (image != null) Image.file(image!),
          ],
        ),
      ),
    );
  }
}
