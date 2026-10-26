import 'package:flutter/material.dart';

class HobbieBox extends StatelessWidget {
  final String hobbie;
  const HobbieBox({super.key, required this.hobbie});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        border: Border.all(color: Colors.grey[800]!, width: 2),
      ),
      child: Center(
        child: Text(
          hobbie,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.black, decoration: TextDecoration.none, fontSize: 16),
        ),
      ),
    );
  }
}