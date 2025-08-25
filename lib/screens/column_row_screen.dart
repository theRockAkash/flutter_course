import 'package:flutter/material.dart';

import 'columns_screen.dart';

class ColumnRowScreen extends StatelessWidget {
  const ColumnRowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Column Rows Screen")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.grey,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
