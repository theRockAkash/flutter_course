import 'package:flutter/material.dart';

import '../../../widgets/category_list_widget.dart';
import '../../../widgets/loader.dart';
import 'api_case6_controller.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

/// Move Api related code to module repo to better organise your code, separate data layer
class WidgetApiCallCase6Screen extends StatelessWidget {
  WidgetApiCallCase6Screen({super.key});

  final controller = ApiCallCase6Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Repo API Call Case 6 Example")),
      body:  ValueListenableBuilder(
        valueListenable: controller.categoryListState,
        builder: (_,state,_) {
          return state.when(
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
