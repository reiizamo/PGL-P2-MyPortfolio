import 'package:flutter/material.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*
        GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 2.5,
          padding: const EdgeInsets.all(20),
          children: [

          ],
        ),
        */
        FloatingActionButton(
          onPressed: null,
          shape: CircleBorder(),
          backgroundColor: Color(0xFF52005D), // #52005d
          foregroundColor: Colors.white,
          child: Icon(Icons.add)
        )
      ],
    );
  }
}