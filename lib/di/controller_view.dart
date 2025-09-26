import 'package:flutter/material.dart';
import 'package:flutter_course/di/controller_store.dart';

import 'base_controller.dart';

/// @Created by akash on 26-09-2025.
/// Know more about author at https://akash.cloudemy.in

abstract class ControllerView<T extends BaseController>
    extends StatelessWidget {
  const ControllerView({super.key});

  T get controller => ControllerStore.find<T>();

  @override
  Widget build(BuildContext context);
}
