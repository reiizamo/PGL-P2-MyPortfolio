import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key, 
    required this.title, 
    required this.selected, 
    required this.onTap
  });

  final String title;
  final bool selected; 
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      selected: selected,
      onTap: () {
        onTap();
        Navigator.pop(context);
      },
    );
  }
}