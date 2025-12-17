/// @Created by akash on 26-09-2025.
/// Know more about author at https://akash.cloudemy.in

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';
import '../source/auth_api_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> login(String email, String password) async {
    final json = await remoteDataSource.login(email, password);
    return UserModel.fromJson(json).toEntity();
  }
}

