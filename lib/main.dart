import 'package:flutter/material.dart';
import 'package:twowayscroll/without_stack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          primaryColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            foregroundColor: Colors.black,
          )),
      home: const WithoutStack(),
    );
  }
}
