import 'package:flutter/material.dart';
import 'package:proyecto_canario/widgets/hobbie_box.dart';

class Hobbies extends StatelessWidget {
  final List<String> hobbies;
  const Hobbies({super.key, required this.hobbies});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 2.5,
      padding: const EdgeInsets.all(20),
      children: [
        for (final hobbie in hobbies) HobbieBox(hobbie: hobbie)
      ],
    );
  }
}