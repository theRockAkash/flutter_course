/// @Created by akash on 17-12-2025.
/// Know more about author at https://akash.cloudemy.in
import '../../domain/entities/user.dart';

class UserModel {
  final int id;
  final String email;
  final String token;

  UserModel({
    required this.id,
    required this.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      token: json['token'],
    );
  }

  User toEntity() {
    return User(
      id: id,
      email: email,
      token: token,
    );
  }
}
