import '../entities/user.dart';

/// @Created by akash on 17-12-2025.
/// Know more about author at https://akash.cloudemy.in


abstract class AuthRepository {
  Future<User> login(String email, String password);
}
