import 'package:flutter/material.dart';
import 'package:storagedemo/local_storage/local_storage_demo.dart';

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
        child: Wrap(
          children: [
            _FeatureButton(
              "Local Storage",
              (context) => const LocalStorageDemo(),
            ),
          ],
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
