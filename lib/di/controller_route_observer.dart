import 'package:flutter/material.dart';

import 'controller_store.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in
///
class ControllerRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name != null) {
      ControllerStore.setCurrentRoute(route.settings.name!);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (route.settings.name != null) {
      ControllerStore.disposeRoute(route.settings.name!);
    }
    if (previousRoute?.settings.name != null) {
      ControllerStore.setCurrentRoute(previousRoute!.settings.name!);
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    if (route.settings.name != null) {
      ControllerStore.disposeRoute(route.settings.name!);
    }
    if (previousRoute?.settings.name != null) {
      ControllerStore.setCurrentRoute(previousRoute!.settings.name!);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute?.settings.name != null) {
      ControllerStore.disposeRoute(oldRoute!.settings.name!);
    }
    if (newRoute?.settings.name != null) {
      ControllerStore.setCurrentRoute(newRoute!.settings.name!);
    }
  }
}
