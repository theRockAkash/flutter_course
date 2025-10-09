import 'package:flutter/foundation.dart';
import 'package:flutter_course/di/base_controller.dart';
import 'package:flutter_course/modules/home/repo/home_repo.dart';

import '../../../api/ui_state.dart';
import '../../../common/models/category_item.dart';
import '../../../di/reactives.dart';
import '../models/product.dart';

/// @Created by akash on 19-09-2025.
/// Know more about author at https://akash.cloudemy.in

class HomeController extends BaseController{
  final repo = HomeRepo();

  Rx<UiState<List<CategoryItem>>> categoryListState = Rx(UiState.none());

  Rx<UiState<List<Product>>> productListState = Rx(UiState.none());

 // RxUiState<List<Product>> productListState2 = Rx(UiState.none());

 // RxUiStateList<Product> productListState3 = Rx(UiState.none());


  @override
  void onInit() {
   // debugPrint("==============> do something when constructor is called");

  }

  @override
  void onReady() {
    getCategoryList();
    getProducts();
    super.onReady();
  }
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

  @override
  void onDispose() {
    categoryListState.dispose();
    productListState.dispose();
    super.onDispose();
  }
}
