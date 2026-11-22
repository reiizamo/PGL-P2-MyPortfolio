import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:proyecto_canario/repositories/auth_repository.dart';
import 'package:proyecto_canario/services/api_expection.dart';
import 'package:proyecto_canario/widgets/message_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.authRepository});

  final AuthRepository authRepository;

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  bool _loadingMessage = false;

  Future<void> _showWelcomeMessage() async {
    setState(() => _loadingMessage = true);
    try{
      final message = await widget.authRepository.getWelcomeMessage();
      if (!mounted) return;
      await showMessageDialog(context, message);
    } on ApiException catch (e) {
      if (!mounted) return;
      await showMessageDialog(context, e.message);
      if (!mounted) return;
      if (e.statusCode == 401) context.go('/login');
    } catch (_) {
      if (!mounted) return;
      await showMessageDialog(context, 'Ocurrió un error inesperado.');
    } finally {
      if (mounted) setState(() => _loadingMessage = false);
    }
  }

  Future<void> _logout() async {
    await widget.authRepository.logOut();
    if (!mounted) return;
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background_App.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Bienvenido a SportMapper",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight(800),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 260,
              child: FilledButton(
                onPressed: _loadingMessage ? null : _showWelcomeMessage,
                child: const Text('Mensaje de bienvenida'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 260,
              child: FilledButton(
                onPressed: _logout,
                child: const Text('Cerrar sesión'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
