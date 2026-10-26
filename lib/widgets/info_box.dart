import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final int index;
  const InfoBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 40),
      height: height * 0.15,
      width: width,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              index == 0 ? "assets/images/mono2.jpg" : "assets/images/mono.png",
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          Container(width: 15),
          Expanded(
            child: Text(
              "Soy un aprendiz de todo y maestro de nada",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 16, color: Colors.black, decoration: TextDecoration.none),
            ),
          )
        ],
      ),
    );
  }
}
