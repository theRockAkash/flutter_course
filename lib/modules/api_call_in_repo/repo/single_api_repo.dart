import 'dart:convert';

import 'package:flutter_course/api/ui_state.dart';
import 'package:http/http.dart' as http;

import '../../../data/category_item.dart';
import '../../../utils/constants.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

class SingleApiRepo {
  Future<void> getCategoryList({
    required Function(UiState<List<CategoryItem>>) callback,
  }) async {
    callback.call(UiState.loading());
    final res = await http.get(Uri.parse("$baseUrl/categories"));
    if (res.statusCode == 200) {
      try {
        final list = (jsonDecode(res.body) as List)
            .map((e) => CategoryItem.fromJson(e))
            .toList();
        callback.call(UiState.success(list));
      } catch (e) {
        callback.call(UiState.error(e.toString()));
      }
    } else {
      callback.call(UiState.error(res.reasonPhrase ?? "Something Went wrong"));
    }
  }
}
