import 'package:flutter/material.dart';
import 'package:flutter_course/routes/app_screens.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, AppScreens.widgetAPICall);
              },
              child: Text("API call in Widget"),
            ),
            SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, AppScreens.widgetAPICallCase2);
              },
              child: Text("API call in Widget Case 2"),
            ),
            SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, AppScreens.widgetAPICallCase3);
              },
              child: Text("API call in Controller"),
            ),
            SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, AppScreens.widgetAPICallCase4);
              },
              child: Text("API call in Controller case 4"),
            ),
            SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, AppScreens.widgetAPICallCase5);
              },
              child: Text("API call in Controller case 5"),
            ),
            SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, AppScreens.widgetAPICallCase6);
              },
              child: Text("API call in Single Repo"),
            ),
            SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, AppScreens.standardAPICall);
              },
              child: Text("Standard API call"),
            ),
          ],
        ),
      ),
    );
  }
}
