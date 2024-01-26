import 'package:flutter/material.dart';
import 'package:reactiveformexample/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Reactive Forms',
      home: const MyHomePage(),
    );
  }
}
