import 'package:flutter/material.dart';
import 'package:flutter_course/routes/app_routes.dart';

import 'di/controller_route_observer.dart';

/// @Created by akash on 17-12-2025.
/// Know more about author at https://akash.cloudemy.in

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      routes: appRoutes,
      navigatorObservers: [ControllerRouteObserver()],
    );
  }
}
