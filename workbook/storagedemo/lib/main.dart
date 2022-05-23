import 'package:flutter/material.dart';
import 'package:storagedemo/hive/hive_demo.dart';
import 'package:storagedemo/isar/isar_demo.dart';
import 'package:storagedemo/local_storage/local_storage_demo.dart';
import 'package:storagedemo/objectbox/objectbox_demo.dart';
import 'package:storagedemo/secure_storage/secure_storage_demo.dart';
import 'package:storagedemo/shared_preferences/shared_preferences_demo.dart';
import 'package:storagedemo/sqlite/sqflite_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Storing data"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _FeatureButton(
                "Local Storage",
                (context) => const LocalStorageDemo(),
              ),
              _FeatureButton(
                "Shared Preferences",
                (context) => const SharedPreferencesDemo(),
              ),
              _FeatureButton(
                "Secure Storage",
                (context) => const SecureStorageDemo(),
              ),
              _FeatureButton(
                "Sqflite",
                (context) => const SqfliteDemo(),
              ),
              _FeatureButton(
                "Hive",
                (context) => const HiveDemo(),
              ),
              _FeatureButton(
                "Isar",
                (context) => const IsarDemo(),
              ),
              _FeatureButton(
                "Objectbox",
                (context) => const ObjectboxDemo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureButton extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  final String title;
  const _FeatureButton(this.title, this.builder, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: builder,
          ),
        ),
        child: Text(title),
      );
}
