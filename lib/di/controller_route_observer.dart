import 'package:flutter/material.dart';

import 'controller_store.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in
///
class ControllerRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (route.settings.name != null) {
      ControllerStore.disposeRoute(route.settings.name!);
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    if (route.settings.name != null) {
      ControllerStore.disposeRoute(route.settings.name!);
    }
  }
}
