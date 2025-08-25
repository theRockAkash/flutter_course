import 'package:flutter/material.dart';
import 'package:flutter_course/screens/columns_screen.dart';

class RowColumnScreen extends StatelessWidget {
  const RowColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rows Column Screen")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              color: Colors.grey,
              width: 250,
              height: 140,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            Column(mainAxisSize: MainAxisSize.min, children: [Box(), Box()]),
          ],
        ),
      ),
    );
  }
}
