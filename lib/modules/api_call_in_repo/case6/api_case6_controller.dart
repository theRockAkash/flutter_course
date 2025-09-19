import 'package:flutter/cupertino.dart';
import 'package:flutter_course/api/ui_state.dart';

import '../../../common/models/category_item.dart';
import '../repo/single_api_repo.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

class ApiCallCase6Controller {
  ApiCallCase6Controller() {
    getCategoryList();
  }

  final repo = SingleApiRepo();
  ValueNotifier<UiState<List<CategoryItem>>> categoryListState = ValueNotifier(UiState.none());

  Future<void> getCategoryList() async {
    repo.getCategoryList(
      callback: (state) {
        categoryListState.value = state;
      },
    );
  }

  void dispose() {
    categoryListState.dispose();
  }
}
