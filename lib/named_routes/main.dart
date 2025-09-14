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
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => NotFoundScreen(),
        );
      },
    );
  }
}
