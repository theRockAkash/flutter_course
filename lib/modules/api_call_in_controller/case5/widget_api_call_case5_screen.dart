import 'package:flutter/material.dart';

import '../../../widgets/category_list_widget.dart';
import '../../../widgets/loader.dart';
import 'api_case5_controller.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

/// Don't create isLoading, error, and data, to hold different state of single Api
/// Instead use UiState sealed class to manage network or Ui State in single variable

class WidgetApiCallCase5Screen extends StatelessWidget {
  WidgetApiCallCase5Screen({super.key});

  final controller = ApiCallCase5Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Controller API Call Case 5 Example")),
      // isLoading?CustomLoader():categoryList!=null?CategoryListWidget(list:categoryList!):Text(error ?? "Invalid State")
      body: controller.categoryListState.onChange(
        builder: (value) {
          return value.when(
            success: (data) => CategoryListWidget(list: data),
            error: (err) => Text(err),
            loading: () => CustomLoader(),
            none: () => SizedBox(),
          );
        },
      ),
    );
  }

  /*

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widget API Call Case 5 Example")),
      // isLoading?CustomLoader():categoryList!=null?CategoryListWidget(list:categoryList!):Text(error ?? "Invalid State")
      body: ValueListenableBuilder(
        valueListenable: controller.categoryListState,
        builder: (context, value, child) {
          return controller.categoryListState.value.when(
            success: (data) => CategoryListWidget(list: data),
            error: (err) => Text(err),
            loading: () => CustomLoader(),
            none: () => SizedBox(),
          );
        },
      ),
    );
  }
*/
}
