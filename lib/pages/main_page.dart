import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_canario/widgets/drawer_item.dart';
import 'package:proyecto_canario/config/page_config.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.child, required this.location});

  final Widget child;
  final String location;

  @override
  Widget build(BuildContext context) {
    final config = pageConfigs[location] ?? pageConfigs['/']!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: config.appBarColor,
        title: Center(
          child: Text(
            config.title,
            style: TextStyle(
              fontSize: 20,
              color: config.textColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: config.textColor),
      ),
      body: child,
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
              selected: location == '/',
              onTap: () => context.go('/')
            ),
            DrawerItem(
              title: "Porfolio", 
              selected: location == '/porfolio', 
              onTap: () => context.go('/porfolio')
            ),
          ],
        ),
      ),
    );
  }
  
}