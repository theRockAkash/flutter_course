import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/loader.dart';

import '../../../widgets/category_list_widget.dart';
import 'api_call_case3_controller.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in
class WidgetApiCallCase3Screen extends StatefulWidget {
  const WidgetApiCallCase3Screen({super.key});

  @override
  State<WidgetApiCallCase3Screen> createState() =>
      _WidgetApiCallCase3ScreenState();
}

class _WidgetApiCallCase3ScreenState extends State<WidgetApiCallCase3Screen> {
  final controller = ApiCallCase3Controller();

  @override
  void initState() {
    controller.getCategoryList();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widget API Call Case 3 Example")),
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
