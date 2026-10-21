import 'package:flutter/material.dart';
import 'package:proyecto_canario/pages/porfolio_page.dart';
import 'package:proyecto_canario/pages/home_page.dart';
import 'package:proyecto_canario/widgets/drawer_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  String _appbarText = "Holaaa";
  Color _appbarColor = Colors.white;
  Color _textColor = Colors.black;

  static const List<Widget> _pages = [
    HomePage(),
    PorfolioPage()
  ];

  void _onItemTapped(int index, String text, Color appColor, Color textColor) {
    setState((){
      _selectedIndex = index;
      _appbarText = text;
      _appbarColor = appColor;
      _textColor = textColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _appbarColor,
        title: Center(
          child: Text(
            _appbarText,
            style: TextStyle(
              fontSize: 20,
              color: _textColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
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
            DrawerItem(
              title: "Bienvenido", 
              selected: _selectedIndex == 0, 
              onTap: () => _onItemTapped(0, "Holaaa", Colors.white, Colors.black)
            ),
            DrawerItem(
              title: "Porfolio", 
              selected: _selectedIndex == 1, 
              onTap: () => _onItemTapped(1, "PROfolio", Colors.purple, Colors.white)
            ),
          ],
        ),
      ),
    );
  }
}