
import 'package:flutter/material.dart';

import '../main.dart';
class SecondScreen extends StatelessWidget {
  final Person? person;
  const SecondScreen({this.person});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Person?;
    final displayPerson = person ?? args;

    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayPerson != null
                  ? "Name: ${displayPerson.name}\nAge: ${displayPerson.age}"
                  : "No data received",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text("Return to Home with Data"),
              onPressed: () {
                Navigator.pop(context, "Data = Second!");
              },
            ),
          ],
        ),
      ),
    );
  }
}