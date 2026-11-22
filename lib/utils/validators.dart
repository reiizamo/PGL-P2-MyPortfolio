final RegExp _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

String? validateEmail(String? value) {
  final text = value?.trim() ?? '';
  if (text.isEmpty) return 'Introduce tu email.';
  if (!_emailRegex.hasMatch(text)) return 'Introduce un email válido.';
  return null;
}

String? validateNewPassword(String? value) {
  final text = value ?? '';
  if (text.isEmpty) return 'Introduce una contraseña.';
  if (text.length < 8) return 'Debe tener al menos 8 caracteres.';
  if (!text.contains(RegExp(r'[A-Z]'))) return 'Debe incluir una mayúscula.';
  if (!text.contains(RegExp(r'[a-z]'))) return 'Debe incluir una minúscula.';
  if (!text.contains(RegExp(r'[0-9]'))) return 'Debe incluir un número.';
  if (!text.contains(RegExp(r'[^A-Za-z0-9]'))) {
    return 'Debe incluir un símbolo (por ejemplo: ! @ # \$).';
  }
  return null;
}

String? validateLoginPassword(String? value) {
  if (value == null || value.isEmpty) return 'Introduce tu contraseña.';
  return null;
}