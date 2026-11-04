import 'package:flutter/material.dart';

class SportBox extends StatelessWidget {

  final String name;
  final String description;
  final String category;

  SportBox({super.key, 
                  required this.name, 
                  required this.description,
                  required this.category
  });

  final Map<String, String> images = {
    'boxeo': 'assets/images/boxeo.png',
    'atletismo': 'assets/images/atletismo.png',
    'esgrima': 'assets/images/esgrima.png',
    'kendo': 'assets/images/kendo.png',
    'voleibol': 'assets/images/voleybol.png',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF220026), // #220026
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            images[category.toLowerCase()] ?? 'assets/images/default.png',
            width: 200, 
            height: 130, 
            fit: BoxFit.cover,
            color: const Color.fromRGBO(255, 255, 255, 0.3), // #220026
            colorBlendMode: BlendMode.modulate,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25
              ),
            ),
          ),
        ],
      ),
    );
  }
}