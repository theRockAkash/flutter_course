/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

import 'package:flutter/foundation.dart';
import 'package:flutter_course/api/ui_state.dart';

class HomeController extends ChangeNotifier {
  UiState<User> state = UiState.none();
  HomeController() {
    getDataFromApi();
  }
  Future<void> getDataFromApi() async {
    state = UiState.loading();
    notifyListeners();
    try {
      // Simulate API call
      final body={'name': 'Bob', 'age': 30};
      await Future.delayed(const Duration(seconds: 1));
      final res=User.fromJson(body);

      state = UiState.success(res);
    } catch (e) {
      state = UiState.error("Something went wrong");
    }
    notifyListeners();
  }

  @override
  void dispose() {
    debugPrint("==============> dispose");
    super.dispose();
  }
}

class User {
  final String name;
  final int age;

  User(this.name, this.age);

  /// Create from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['name'] as String,
      json['age'] as int,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() => 'User(name: $name, age: $age)';
}

