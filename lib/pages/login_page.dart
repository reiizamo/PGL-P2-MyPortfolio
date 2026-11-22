import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:proyecto_canario/repositories/auth_repository.dart';
import 'package:proyecto_canario/services/api_expection.dart';
import 'package:proyecto_canario/utils/validators.dart';
import 'package:proyecto_canario/widgets/message_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.authRepository});

  final AuthRepository authRepository;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _checkSession() async{
    try{
      final hasSesion = await widget.authRepository.restoreSession();
      if (hasSesion && mounted) context.go('/');
    } catch (_){
      // Se queda en el login
    }
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      await widget.authRepository.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      if (!mounted) return;
      await showMessageDialog(context, 'Inicio de sesión exitoso.');
      if (!mounted) return;
      context.go('/');
    } on ApiException catch (e) {
      if (!mounted) return;
      await showMessageDialog(context, e.message);
    } catch (_) {
      if (!mounted) return;
      await showMessageDialog(context, 'Ocurrió un error inesperado.');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        validator: validateEmail,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: validateLoginPassword,
                        decoration: InputDecoration(
                          labelText: 'Contraseña'
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: _loading ? null : _login,
                              child: const Text('Iniciar Sesión'),
                            ),
                          ),
                          Expanded(
                            child: FilledButton(
                              onPressed: _loading ? null : () => context.go('/register'),
                              child: const Text('Crear Cuenta'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}