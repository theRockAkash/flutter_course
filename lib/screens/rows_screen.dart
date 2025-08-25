import 'package:flutter/material.dart';

import 'columns_screen.dart';

class RowsScreen extends StatelessWidget {
  const RowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rows Screen")),
      body: SizedBox(
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Box(),
          Box(),
          Box()
        ]),
      ),
    );
  }
}
