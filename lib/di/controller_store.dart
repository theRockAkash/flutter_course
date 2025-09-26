import 'package:flutter/material.dart';

import 'base_controller.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

/// Stores controllers globally, allows auto-dispose
import 'package:flutter/widgets.dart';

class ControllerStore {
  static final _controllers = <String, Map<Type, BaseController>>{};
  static final _lazyFactories = <String, Map<Type, BaseController Function()>>{};

  // Keeps track of current route
  static String? _currentRoute;

  /// Attach to MaterialApp.navigatorObservers
  static final routeObserver = RouteObserver<PageRoute>();

  /// Called automatically when route changes
  static void setCurrentRoute(String? route) {
    _currentRoute = route;
  }

  /// Lazy register controller tied to a route
  static void lazyPut<T extends BaseController>(
      BaseController Function() factory) {
    final route = _currentRoute;
    if (route == null) throw Exception("No active route found for lazyPut");

    final map = _lazyFactories.putIfAbsent(route, () => {});
    map[T] = factory;
  }

  /// Get or create controller for current route
  static T find<T extends BaseController>() {
    final route = _currentRoute;
    if (route == null) throw Exception("No active route found for find");

    final map = _controllers.putIfAbsent(route, () => {});
    if (!map.containsKey(T)) {
      final factory = _lazyFactories[route]?[T];
      if (factory == null) throw Exception("Controller $T not found for route $route");

      final controller = factory();
      map[T] = controller;
      debugPrint("ControllerStore: Created Route [$route] | Controller => ${controller.runtimeType}");
      controller.onInit();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.onReady();
      });
    }
    return map[T]! as T;
  }

  /// Delete all controllers for route
  static void disposeRoute(String route) {
    final map = _controllers.remove(route);
    if (map != null) {
      for (var controller in map.values) {
        controller.onDispose();
        debugPrint("ControllerStore: Disposed Route [$route] | Controller => ${controller.runtimeType}");
      }
    }
    _lazyFactories.remove(route);
  }
}

