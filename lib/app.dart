import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_canario/pages/home_page.dart';
import 'package:proyecto_canario/pages/main_page.dart';
import 'package:proyecto_canario/pages/porfolio_page.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => 
        MainPage(location: state.uri.path, child: child),
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomePage()),
        GoRoute(path: '/porfolio', builder: (context, state) => const PorfolioPage(),)
      ]
    )
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Proyecto Canario",
      routerConfig: _router,
    );
  }
}