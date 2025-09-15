import 'package:flutter/material.dart';

import 'base_controller.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

/// Stores controllers globally, allows auto-dispose
import 'package:flutter/widgets.dart';
class ControllerStore {

  static final _controllers = <String, Map<Type, BaseController>>{};

  static final _lazyFactories = <String, Map<Type, BaseController Function()>>{};

  /// Lazy register controller tied to a route
  static void lazyPut<T extends BaseController>(
      String route, BaseController Function() factory) {
    final map = _lazyFactories.putIfAbsent(route, () => {});
    map[T] = factory;
  }

  /// Get or create controller
  static T find<T extends BaseController>(String route) {
    final map = _controllers.putIfAbsent(route, () => {});
    if (!map.containsKey(T)) {
      // Check lazy factory
      final factory = _lazyFactories[route]?[T];
      if (factory == null) throw Exception("Controller $T not found for route $route");

      final controller = factory();
      map[T] = controller;

      controller.onInit();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.onReady();
      });
    }
    return map[T]! as T;
  }

  /// Delete all controllers for a route
  static void disposeRoute(String route) {
    final map = _controllers.remove(route);
    if (map != null) {
      for (var controller in map.values) {
        controller.onDispose();
      }
    }
    _lazyFactories.remove(route);
  }
}

