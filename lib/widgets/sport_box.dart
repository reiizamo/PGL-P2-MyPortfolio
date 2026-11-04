import 'package:flutter/material.dart';

class SportBox extends StatelessWidget {

  final String name;
  final String description;
  final String category;

  const SportBox({super.key, 
                  required this.name, 
                  required this.description,
                  required this.category
                });

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
            'assets/images/kendo.png', 
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