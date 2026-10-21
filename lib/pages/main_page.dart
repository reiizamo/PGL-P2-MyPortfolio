import 'package:flutter/material.dart';
import 'package:proyecto_canario/pages/demo_page.dart';
import 'package:proyecto_canario/pages/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  String _appbarText = "Holaaa";

  static const List<Widget> _pages = [
    HomePage(),
    DemoPage()
  ];

  void _onItemTapped(int index, String text) {
    setState((){
      _selectedIndex = index;
      _appbarText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appbarText),),
      body: _pages[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                child: Text("Barra Lateral")
              ),
            ),
            ListTile(
              title: Text("Bienvenido"),
              selected: _selectedIndex == 0,
              onTap:() {
                _onItemTapped(0, "Holaaa");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Porfolio"),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1, "PROfolio");
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}