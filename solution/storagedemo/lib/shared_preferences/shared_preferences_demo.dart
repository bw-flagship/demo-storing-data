import 'package:flutter/material.dart';
import 'package:storagedemo/shared_preferences/shared_preferences_service.dart';

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({Key? key}) : super(key: key);

  @override
  State<SharedPreferencesDemo> createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  int? value;
  final _service = SharedPreferencesService();

  @override
  void initState() {
    _service.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _service..write("value", (value ?? 0) + 1),
              child: const Text("Increase"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  value = _service.read("value");
                });
              },
              child: const Text("Read"),
            ),
            const Text("Current value:"),
            Text(
              value == null ? "null" : value.toString(),
            )
          ],
        ),
      ),
    );
  }
}
