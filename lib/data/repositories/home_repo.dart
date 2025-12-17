

import '../../core/network/api_client.dart';
import '../../core/state/ui_state.dart';
import '../models/category_item.dart';
import '../../di/reactives.dart';
import '../../core/utils/error_helper.dart';
import '../../core/utils/network_manager.dart';
import '../models/product.dart';

/// @Created by akash on 19-09-2025.
/// Know more about author at https://akash.cloudemy.in

class HomeRepo {
  Future<void> getCategoryList({
    required Function(UiStateList<CategoryItem>) callback,
  }) async {
    callback.call(UiState.loading());

    if (!await isNetworkAvailable()) {
      callback.call(UiState.error("No Internet available."));
      return;
    }

    final res = await ApiClient.instance.getCategories();

    if (res.isOk) {
      try {
        final categories = (res.body as List<dynamic>)
            .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
            .toList();
        callback.call(UiState.success(categories));
      } catch (e) {
        print(e);
        callback.call(UiState.error(e.toString()));
      }
    } else {
      callback.call(UiState.error(getErrorMsg(res)));
    }
  }

  Future<void> getProducts({
    required int offset,
    int limit = 10,
    required Function(UiStateList<Product>) callback,
  }) async {
    callback.call(UiState.loading());

    if (!await isNetworkAvailable()) {
      callback.call(UiState.error("No Internet available."));
      return;
    }

    final res = await ApiClient.instance.getProducts(offset, limit);

    if (res.isOk) {
      try {
        callback.call(
          UiState.success(
            (res.body as List)
                .map((e) => Product.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
        );
      } catch (e) {
        callback.call(UiState.error(e.toString()));
      }
    } else {
      callback.call(UiState.error(getErrorMsg(res)));
    }
  }
}
