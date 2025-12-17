/// @Created by akash on 17-12-2025.
/// Know more about author at https://akash.cloudemy.in




abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Map<String, dynamic>> login(
      String email, String password) async {
    // fake API
    await Future.delayed(const Duration(seconds: 1));
    return {
      'id': 1,
      'email': email,
      'token': 'jwt_token',
    };
  }
}

