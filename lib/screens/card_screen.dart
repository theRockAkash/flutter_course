import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card Screen")),
      body: Container(
        color: Colors.grey,
        width: double.infinity,
        height: 100,
        child: Card(
          color: Colors.pinkAccent.shade100,
          margin: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.pinkAccent, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("data"),
          ),
        ),
      ),
    );
  }
}
