import 'package:flutter/material.dart';

import '../../../widgets/category_list_widget.dart';
import '../../../widgets/loader.dart';
import 'api_case6_controller.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

class WidgetApiCallCase6Screen extends StatelessWidget {
  WidgetApiCallCase6Screen({super.key});

  final controller = ApiCallCase6Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widget API Call Case 6 Example")),
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

}
