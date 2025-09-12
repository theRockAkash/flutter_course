import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'app_screens.dart';
import 'named_second_screen.dart';
import 'named_home_screen.dart';
import 'not_found_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      // Register routes
      routes: appRoutes,
      initialRoute: AppScreens.home,
      onGenerateRoute: (settings) {
        print("========> Unknown Route: ${settings.name}");
        if (appRoutes[settings.name] == null) {
          final message = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (_) => NotFoundScreen(message: message),
          );
        }
        return null;
      },
    );
  }
}
