import 'package:flutter/material.dart';

class SportDialog extends StatefulWidget {
  const SportDialog({super.key});

  @override
  State<SportDialog> createState() => _SportDialogState();
}

class _SportDialogState extends State<SportDialog> {
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();

  String? selectedCategory;
  final List<String> categories = [
    'Boxeo',
    'Atletismo',
    'Kendo',
    'Esgrima',
    'Voleibol'
  ];

  @override
  void dispose() {
    name.dispose();
    description.dispose();
    super.dispose();
}

  void addSport(){
    if (name.text.trim().isEmpty ||
        description.text.trim().isEmpty ||
        selectedCategory == null) {
      return;
    }

    Navigator.pop(context, {
      'name': name.text.trim(),
      'description': description.text.trim(),
      'category': selectedCategory!,
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Añadir Club"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
              labelText: "Nombre del club"
            ),
          ),
          TextField(
            controller: description,
            decoration: InputDecoration(
              labelText: "Breve descripción"
            ),
          ),
          SizedBox(height: 15,),
          DropdownButtonFormField<String>(
            initialValue: selectedCategory,
            decoration: InputDecoration(
              labelText: "Deportes"
            ),
            items: categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(
                  category
                ),
              );
            }).toList(), 
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
            }
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancelar")
        ),
        ElevatedButton(
          onPressed: addSport,
          child: Text("Añadir")
        ),
      ],
    );
  }
}