import 'package:flutter/material.dart';
import 'package:proyecto_canario/widgets/sport_box.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background_App_Sports.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: const EdgeInsets.all(20),
              children: [
                SportBox(name: "Club SC", description: "SA", category: "SA"),
                SportBox(name: "SA", description: "SA", category: "SA"),
                SportBox(name: "SA", description: "SA", category: "SA"),
                SportBox(name: "SA", description: "SA", category: "SA"),
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: null,
            shape: CircleBorder(),
            backgroundColor: Color(0xFF52005D), // #52005d
            foregroundColor: Colors.white,
            child: Icon(Icons.add)
          )
        ],
      ),
    );
  }
}