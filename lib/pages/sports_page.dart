import 'package:flutter/material.dart';
import 'package:proyecto_canario/widgets/sport_box.dart';
import 'package:proyecto_canario/widgets/sport_dialog.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({super.key});

  @override
  State<SportsPage> createState() => _SportsPageState();
}

  class _SportsPageState extends State<SportsPage> {

    final List<SportBox> sports = [];

    Future<void> openSportDialog() async {
      final result = await showDialog<Map<String, String>>(
        context: context,
        builder: (context) => const SportDialog(),
      );

      if (result != null) {
        setState(() {
          sports.add(
            SportBox(
              name: result['name']!,
              description: result['description']!,
              category: result['category']!,
              onDelete: () {},
            ),
          );
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background_App_Sports.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsGeometry.all(15),
            child: Text(
              'Clubes añadidos: ${sports.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ), 
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: const EdgeInsets.all(20),
              children: List.generate(sports.length, (index) {
                final sport = sports[index];

                return SportBox(
                  name: sport.name,
                  description: sport.description,
                  category: sport.category,
                  onDelete: () {
                    setState(() {
                      sports.removeAt(index);
                    });
                  }
                );
              }),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
              right: 20,
              bottom: 20,
            ),
              child: FloatingActionButton(
                onPressed: openSportDialog,
                shape: CircleBorder(),
                backgroundColor: Color(0xFF52005D), // #52005d
                foregroundColor: Colors.white,
                child: Icon(Icons.add)
              ),
            ),
          ),
        ],
      ),
    );
  }
}