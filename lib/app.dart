import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_canario/pages/login_page.dart';
import 'package:proyecto_canario/pages/register_page.dart';
import 'package:proyecto_canario/pages/home_page.dart';
import 'package:proyecto_canario/pages/main_page.dart';
import 'package:proyecto_canario/pages/porfolio_page.dart';
import 'package:proyecto_canario/pages/sports_page.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/register', builder: (context, state) => const RegisterPage()),
    ShellRoute(
      builder: (context, state, child) => 
        MainPage(location: state.uri.path, child: child),
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomePage()),
        GoRoute(path: '/porfolio', builder: (context, state) => const PorfolioPage()),
        GoRoute(path: '/deportes', builder: (context, state) => const SportsPage())
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