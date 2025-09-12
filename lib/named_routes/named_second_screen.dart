
import 'package:flutter/material.dart';


class NamedSecondScreen extends StatelessWidget {
  final String? message;
  const NamedSecondScreen({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    // ✅ Extract arguments if passed
    final args = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, "✅ Returned from Second");
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message ?? args ??"No data received",
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
 