import 'package:flutter/material.dart';
import 'package:proyecto_canario/pages/tabs/hobbies.dart';
import 'package:proyecto_canario/widgets/info_box.dart';

class PorfolioPage extends StatefulWidget {
  const PorfolioPage({super.key});

  @override
  State<PorfolioPage> createState() => _PorfolioPageState();
}


class _PorfolioPageState extends State<PorfolioPage> {
  int _index = 0;
  static const List<String> _hobbies = [
    "Estar en Casa",
    "Senderismo",
    "Reposteria",
    "Leer Comics/Mangas",
    "Música muu variada",
    "Ver Anime",
    "Videojuegos variados",
    "Aprender variado",
    "Programar",
    "Querer jugar dnd"
  ];

  static const List<Widget> _tabs = [
    Hobbies(hobbies: _hobbies),
    Center(child: Text("Samuel"),),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoBox(index: _index),
        Expanded(child: _tabs[_index]),
        NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Hobbies"),
            NavigationDestination(icon: Icon(Icons.person), label: "GitHub"),
          ],
        )
      ],
    );
  }
}