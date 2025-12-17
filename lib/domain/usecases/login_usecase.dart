/// @Created by akash on 17-12-2025.
/// Know more about author at https://akash.cloudemy.in

import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<User> call(String email, String password) {
    return repository.login(email, password);
  }
}
