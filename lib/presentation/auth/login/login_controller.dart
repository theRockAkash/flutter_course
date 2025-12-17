import 'package:flutter_course/di/base_controller.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login_usecase.dart';

/// @Created by akash on 17-12-2025.
/// Know more about author at https://akash.cloudemy.in


class LoginController extends BaseController {
  final Login loginUseCase;

  LoginController(this.loginUseCase);

  Future<User> login(String email, String password) {
    return loginUseCase.call(email, password);
  }
}
