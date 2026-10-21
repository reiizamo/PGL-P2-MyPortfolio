import 'package:flutter/material.dart';

class PorfolioPage extends StatefulWidget {
  const PorfolioPage({super.key});

  @override
  State<PorfolioPage> createState() => _PorfolioPageState();
}


class _PorfolioPageState extends State<PorfolioPage> {
  int _index = 0;

  static const List<Widget> _tabs = [
    Center(child: Text("Wilson"),),
    Center(child: Text("Samuel"),),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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