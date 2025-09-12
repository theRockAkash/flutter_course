import 'package:flutter/material.dart';

import 'material_page_routes/home_screen.dart';
import 'material_page_routes/second_screen.dart';

// 3 navigation styles without libraries:
//
// Direct MaterialPageRoute → quick & flexible
//
// Named Routes (routes: {}) → centralized & clean
//
// onGenerateRoute → centralized + arguments support

void main() {
  runApp( MyApp());
}

// Model class for demonstration
class Person {
  final String name;
  final int age;

  Person(this.name, this.age);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      debugShowCheckedModeBanner: false,
      routes: {
        '/second': (context) => SecondScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/generate') {
          final person = settings.arguments as Person?;
          return MaterialPageRoute(
            builder: (_) => SecondScreen(person: person),
          );
        }
        return null;
      },
      home: HomeScreen(),
    );
  }
}
