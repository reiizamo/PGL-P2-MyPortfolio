import 'package:flutter/material.dart';
import 'package:proyecto_canario/pages/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Proyecto Canario",
      home: MainPage(),
    );
  }
}