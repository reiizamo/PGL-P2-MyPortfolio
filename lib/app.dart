import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Proyecto Canario",
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Background_App.png"),
              fit: BoxFit.cover
            )
          ),
          child: const Center(
            child: Text(
              "Bienvenido", 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 50,
                fontWeight:FontWeight(800)
                ),
              ),
            ),
        ),
      )
    );
  }
}