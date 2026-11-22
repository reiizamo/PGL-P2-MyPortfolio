import 'package:material_ui/material_ui.dart';

Future<void> showMessageDialog(BuildContext context, String message){
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: const Text('Aceptar'),
        )
      ],
    )
  );
}