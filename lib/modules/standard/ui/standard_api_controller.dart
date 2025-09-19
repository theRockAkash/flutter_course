import 'package:flutter_course/modules/standard/repo/standard_api_repo.dart';

import '../../../api/ui_state.dart';
import '../../../common/models/category_item.dart';
import '../../../di/reactives.dart';
import '../models/product.dart';

/// @Created by akash on 19-09-2025.
/// Know more about author at https://akash.cloudemy.in

class StandardApiController {
  StandardApiController() {
    getCategoryList();
    getProducts();
  }

  final repo = StandardApiRepo();

  Rx<UiState<List<CategoryItem>>> categoryListState = Rx(UiState.none());
  Rx<UiState<List<Product>>> productListState = Rx(UiState.none());

  Future<void> getCategoryList() async {
    repo.getCategoryList(
      callback: (state) {
        categoryListState.value = state;
      },
    );
  }

  Future<void> getProducts() async {
    repo.getProducts(
      offset: 0,
      limit: 10,
      callback: (state) {
        productListState.value = state;
      },
    );
  }

  void dispose() {
    categoryListState.dispose();
    productListState.dispose();
  }
}
