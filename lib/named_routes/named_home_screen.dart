
import 'package:flutter/material.dart';
import 'package:flutter_course/named_routes/named_second_screen.dart';

import '../material_page_routes/second_screen.dart';
import 'app_screens.dart';

class NamedHomeScreen extends StatelessWidget {
  const NamedHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Named Home Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              child: Text("Go to Second (no data)"),
              onPressed: () {
                Navigator.pushNamed(context, AppScreens.secondScreen);
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text("Go with arguments"),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/ds',
                  arguments: "📦 Data via arguments",
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text("Await result from Second"),
              onPressed: () async {
                final result = await Navigator.pushNamed(
                  context,
                  AppScreens.secondScreen,
                  arguments: "Pick a value to return",
                );
                if(context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Got result: $result")),
                );
                }
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text("Replace with Second"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppScreens.secondScreen);
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text("Clear stack and go to Second"),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                      AppScreens.secondScreen,
                      (route) => false, // remove all previous routes
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}