import 'package:flutter/material.dart';
import 'package:flutter_course/screens/columns_screen.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rows Screen")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey.shade800,
            ),
            Positioned(top: 16, right: 16, child: Box()),
            Positioned(left: 0, bottom: 0, child: Box()),
          ],
        ),
      ),
    );
  }
}
