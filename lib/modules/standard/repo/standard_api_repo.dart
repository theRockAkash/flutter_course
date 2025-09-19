import 'package:flutter_course/api/get_connect_api_client.dart';
import 'package:flutter_course/modules/standard/models/product.dart';

import '../../../api/ui_state.dart';
import '../../../common/models/category_item.dart';
import '../../../utils/error_helper.dart';
import '../../../utils/network_manager.dart';

/// @Created by akash on 19-09-2025.
/// Know more about author at https://akash.cloudemy.in

class StandardApiRepo {
  Future<void> getCategoryList({
    required Function(UiState<List<CategoryItem>>) callback,
  }) async {
    callback.call(UiState.loading());

    if (!await isNetworkAvailable()) {
      callback.call(UiState.error("No Internet available."));
      return;
    }

    final res = await GetConnectApiClient.instance.getCategories();

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
    required Function(UiState<List<Product>>) callback,
  }) async {
    callback.call(UiState.loading());

    if (!await isNetworkAvailable()) {
      callback.call(UiState.error("No Internet available."));
      return;
    }

    final res = await GetConnectApiClient.instance.getProducts(offset, limit);

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
