import 'package:proyecto_canario/services/auth_service.dart';
import 'package:proyecto_canario/services/api_expection.dart';
import 'package:proyecto_canario/services/token_storage.dart';

class AuthRepository {
  AuthRepository({AuthService? auth_service, TokenStorage? token_storage}):
    _authService = auth_service ?? AuthService(),
    _tokenStorage = token_storage ?? TokenStorage();

  final AuthService _authService;
  final TokenStorage _tokenStorage;

  Future<String> register({
    required String fullName,
    required String email,
    required String password,
  }) {
    return _authService.register(fullName: fullName, email: email, password: password);
  }

  Future<void> login({required String email, required String password}) async {
    final token = await _authService.login(email: email, password: password);
    await _tokenStorage.save(token);
  }

  Future<bool> restoreSession() async {
    final token = await _tokenStorage.read();
    if (token == null || token.isEmpty) return false;

    final isValid = await _authService.validateToken(token);
    if (!isValid) {
      await _tokenStorage.delete();
    }
    return isValid;
  }

  Future<void> logOut(){
    return _tokenStorage.delete();
  }

  Future<String> getWelcomeMessage() async{
    final token = await _tokenStorage.read();
    if (token == null || token.isEmpty) {
      throw const ApiException('No hay sesión iniciada.', statusCode: 401);
    }
    try{
      return await _authService.getWelcomeMessage(token);
    } on ApiException catch (e) {
      if (e.statusCode == 401) {
        await _tokenStorage.delete();
      }
      rethrow;
    }
  }
}