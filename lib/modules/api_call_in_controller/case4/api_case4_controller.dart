import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../common/models/category_item.dart';
import '../../../utils/constants.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

class ApiCallCase4Controller {
  ApiCallCase4Controller() {
    getCategoryList();
  }

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<String?> error = ValueNotifier(null);
  ValueNotifier<List<CategoryItem>?> categoryList = ValueNotifier(null);

  Future<void> getCategoryList() async {
    isLoading.value = true;
    final res = await http.get(Uri.parse("$baseUrl/categories"));
    if (res.statusCode == 200) {
      error.value = null;
      isLoading.value = false;
      try {
        categoryList.value = (jsonDecode(res.body) as List)
            .map((e) => CategoryItem.fromJson(e))
            .toList();
      } catch (e) {
        error.value = e.toString();
      }
    } else {
      isLoading.value = false;
      categoryList.value = null;
      error.value = res.reasonPhrase ?? "Something Went wrong";
    }
  }
  void dispose() {
    isLoading.dispose();
    error.dispose();
    categoryList.dispose();
  }
}
