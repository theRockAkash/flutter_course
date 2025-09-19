

import 'package:flutter/material.dart';

import '../../../widgets/category_list_widget.dart';
import '../../../widgets/loader.dart';
import 'api_case4_controller.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

/// Don't write stateful widget, instead use stateless- light weight widget
/// Call api initially in controller constructor

class WidgetApiCallCase4Screen extends StatelessWidget {
  WidgetApiCallCase4Screen({super.key});

  // call api in constructor
  final controller = ApiCallCase4Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Controller API Call Case 4 Example")),
      // isLoading?CustomLoader():categoryList!=null?CategoryListWidget(list:categoryList!):Text(error ?? "Invalid State")
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: controller.isLoading,
            builder: (context, value, child) {
              if (controller.isLoading.value) {
                return CustomLoader();
              }
              return SizedBox.shrink();
            },
          ),

          Expanded(
            child: ValueListenableBuilder(
              valueListenable: controller.categoryList,
              builder: (context, value, child) {
                if (controller.categoryList.value != null) {
                  return CategoryListWidget(
                    list: controller.categoryList.value!,
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: controller.error,
            builder: (context, value, child) {
              if (controller.error.value != null) {
                return Text(controller.error.value ?? "Invalid State");
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
