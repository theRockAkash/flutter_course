/// @Created by akash on 17-12-2025.
/// Know more about author at https://akash.cloudemy.in
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../data/models/user_model.dart';

class AuthService {
  final _storage = const FlutterSecureStorage();

  static const _tokenKey = 'auth_token';

  UserModel? _currentUser;

  bool get isLoggedIn => _currentUser != null;

  UserModel? get currentUser => _currentUser;

  Future<void> saveSession(UserModel user) async {
    _currentUser = user;
    await _storage.write(key: _tokenKey, value: user.token);
  }

  Future<void> loadSession() async {
    final token = await _storage.read(key: _tokenKey);
    if (token != null) {
      _currentUser = UserModel(
        id: 0,
        email: '',
        token: token,
      );
    }
  }

  Future<void> logout() async {
    _currentUser = null;
    await _storage.delete(key: _tokenKey);
  }
}
