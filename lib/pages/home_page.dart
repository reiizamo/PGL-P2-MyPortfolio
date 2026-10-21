import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Holaa")),
      body: Container(
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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                child: Text("Barra Lateral"),
              ),
            ),
            ListTile(
              title: Text("Bienvenido"),
              onTap: () {
                
              },
            ),
            ListTile(
              title: Text("Porfolio"),
              onTap: () {
                
              },
            )
          ],
        ),
      ),
    );
  }
}