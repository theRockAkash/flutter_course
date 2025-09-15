/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

import 'package:flutter/material.dart';

/// A reactive variable that notifies only its listeners
class Rx<T> extends ValueNotifier<T> {
  Rx(super.value);

  /// Returns a widget that rebuilds when this Rx changes
  Widget onChange({required Widget Function(T value) builder}) {
    return ValueListenableBuilder<T>(
      valueListenable: this,
      builder: (_, value, __) => builder(value),
    );
  }
}



