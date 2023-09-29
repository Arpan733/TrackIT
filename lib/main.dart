import 'package:flutter/material.dart';
import 'package:sih2/backend.dart';
import 'package:sih2/screens/livelocation.dart';
import 'package:sih2/screens/trackit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    backend.fetchData();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: trackit(),
    );
  }
}
