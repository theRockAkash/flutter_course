/// @Created by akash on 26-09-2025.
/// Know more about author at https://akash.cloudemy.in

import '../models/user_model.dart';
import '../../core/network/api_response.dart';
import '../source/auth_api_source.dart';

class AuthRepository {
  final AuthApiSource apiSource;

  AuthRepository(this.apiSource);

  Future<ApiResponse<UserModel>> login(
      String email,
      String password,
      ) async {
    final response = await apiSource.login(
      email: email,
      password: password,
    );

    if (response.isOk) {
      final user = UserModel.fromJson(response.body);
      return ApiResponse.success(user);
    } else {
      return ApiResponse.error(
        response.statusCode ?? 500,
        response.statusText ?? 'Unknown error',
      );
    }
  }

  Future<ApiResponse<UserModel>> signup(
      String name,
      String email,
      String password,
      ) async {
    final response = await apiSource.signup(
      name: name,
      email: email,
      password: password,
    );

    if (response.isOk) {
      return ApiResponse.success(
        UserModel.fromJson(response.body),
      );
    } else {
      return ApiResponse.error(
        response.statusCode ?? 500,
        response.statusText ?? 'Signup failed',
      );
    }
  }
}
