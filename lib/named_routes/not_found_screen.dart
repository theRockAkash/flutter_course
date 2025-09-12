
import 'package:flutter/material.dart';


class NotFoundScreen extends StatelessWidget {
  final String? message;
  const NotFoundScreen({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    // ✅ Extract arguments if passed
    final args = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text("Not Found Screen"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, "✅ Not Found");
          },
        ),
      ),
      body: Center(
        child: Text(
          message ?? args ?? "No message received",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
 