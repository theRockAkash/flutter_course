/// @Created by akash on 17-12-2025.
/// Know more about author at https://akash.cloudemy.in

import 'package:get/get_connect/http/src/response/response.dart';

import '../../core/network/api_client.dart';

class AuthApiSource {
  final ApiClient apiClient;

  AuthApiSource(this.apiClient);

  Future<Response<dynamic>> login({
    required String email,
    required String password,
  }) {
    return apiClient.post(
      '/login', {
        'email': email,
        'password': password,
      },
    );
  }

  Future<Response<dynamic>> signup({
    required String name,
    required String email,
    required String password,
  }) {
    return apiClient.post(
      '/signup',  {
        'name': name,
        'email': email,
        'password': password,
      },
    );
  }
}
