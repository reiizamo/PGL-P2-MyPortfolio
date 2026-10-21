import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background_App.png"),
            fit: BoxFit.cover 
          ),
        ),
        child: Center(
          child: Text(
            "Bienvenido",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight(800)
            ),
          ),
        ),
      );
  }
}