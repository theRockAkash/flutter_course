/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

import 'package:flutter/material.dart';
import 'package:flutter_course/api/ui_state.dart';

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
typedef TypeA = int;
typedef UiStateList<T> = UiState<List<T>>;

typedef RxUiState<T> = Rx<UiState<T>>;
typedef RxUiStateList<T> = Rx<UiState<List<T>>>;


