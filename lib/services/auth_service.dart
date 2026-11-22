import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_expection.dart';

class AuthService {
  AuthService({http.Client? client}) : _client = client ?? http.Client();
  final http.Client _client;

  static const String _baseUrl = 'https://my-users-api.onrender.com';
  static const String _registerPath = '/users/register';
  static const String _loginPath = '/users/login';
  static const String _verifyTokenPath = '/users/check-token';
  static const String _welcomePath = '/users/welcome';
  static const Duration _timeout = Duration(seconds: 120);

  Future<String> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final response = await _send(
      () => _client.post(
        Uri.parse('$_baseUrl$_registerPath'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'fullName': fullName, 'email': email, 'pwd': password})
      )
    );
    if (response.statusCode != 201) throw _errorFrom(response);
    return _readMessage(response);
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    final response = await _send(
      () => _client.post(
        Uri.parse('$_baseUrl$_loginPath'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'pwd': password}),
      )
    );
    if (response.statusCode != 201) throw _errorFrom(response);
    
    final body = jsonDecode(utf8.decode(response.bodyBytes));
    final token = body is Map<String, dynamic> ? body['token'] : null;
    if (token is! String) {
      throw const ApiException('Respuesta inesperada del servidor');
    }
    return token;
  }

  Future<bool> validateToken(String token) async {
    final response = await _send(
      () => _client.get(
        Uri.parse('$_baseUrl$_verifyTokenPath'),
        headers: _authHeaders(token),
      )
    );

    if (response.statusCode == 200) return true;
    if (response.statusCode == 401) return false;
    throw _errorFrom(response);
  }

  Future<String> getWelcomeMessage(String token) async {
    final response = await _send(
      () => _client.get(
        Uri.parse('$_baseUrl$_welcomePath'),
        headers: _authHeaders(token),
      )
    );
    if (response.statusCode != 200) throw _errorFrom(response);
    return _readMessage(response);
  }

  Map<String, String> _authHeaders(String token){
    return {'Authorization': 'Bearer $token'};
  }

  Future<http.Response> _send(Future<http.Response> Function() request) async {
    try{
      return await request().timeout(_timeout);
    } on TimeoutException {
      throw const ApiException('El servidor tardó demasiado en responder');
    } on http.ClientException {
      throw const ApiException('No se pudo conectar con el servidor');
    }
  }

  ApiException _errorFrom(http.Response response){
    return ApiException(_readMessage(response), statusCode: response.statusCode);
  }

  String _readMessage(http.Response response){
    try{
      final body = jsonDecode(utf8.decode(response.bodyBytes));
      if (body is Map<String, dynamic> && body['message'] is String){
        return body['message'] as String;
      }
    } catch (_) {

    }
    return 'Respuesta inesperada del servidor (${response.statusCode})';
  }
}