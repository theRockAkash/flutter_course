import 'package:flutter/material.dart';

import '../main.dart';
import 'second_screen.dart';

class HomeScreen extends StatelessWidget {
  final personData = Person("Alice", 28);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              child: Text("Direct Route with Constructor"),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SecondScreen(person: personData),
                  ),
                );
                showResult(context, result);
              },
            ),
            SizedBox(height: 10),

            ElevatedButton(
              child: Text("Direct Route with Arguments"),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SecondScreen(),
                    settings: RouteSettings(arguments: personData),
                  ),
                );
                if (context.mounted) {
                  showResult(context, result);
                }
              },
            ),
            SizedBox(height: 20),

            ElevatedButton(
              child: Text("Named Route with Arguments"),
              onPressed: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/second',
                  arguments: personData,
                );
                debugPrint("=============> End of Function");
                if (context.mounted) {
                  showResult(context, result);
                }
              },
            ),
            SizedBox(height: 20),

            ElevatedButton(
              child: Text("onGenerateRoute with Arguments"),
              onPressed: () {
                Navigator.pushNamed(context, '/generate1', arguments: personData,)
                    .then((result) {
                  if (context.mounted) {
                    showResult(context, result);
                  }
                });
                debugPrint("=============> End of Function");
              },
            ),
          ],
        ),
      ),
    );
  }

  void showResult(BuildContext context, Object? result) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Returned data: $result")));
  }
}
