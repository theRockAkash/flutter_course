import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_course/api/ui_state.dart';
import 'package:flutter_course/di/reactives.dart';
import 'package:http/http.dart' as http;

import '../../../data/category_item.dart';
import '../../../utils/constants.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

class ApiCallCase5Controller {
  ApiCallCase5Controller() {
    getCategoryList();
  }

  int number =1;
  UiState<int> numberState= UiState.success(1);

  List<int> numberList =[1,2,3];
  UiState<List<int>> numberListState =UiState.success([1,2,3]);


 // ValueNotifier<int> numberOb2 =ValueNotifier(1);
  Rx<int> numberOb =Rx(1);
  Rx<List<int>> numberListOb =Rx([1,2,3]);


  Rx<UiState<List<int>>> numListOb = Rx(UiState.success([1,2,3]));



  Rx<UiState<List<CategoryItem>>> categoryListState = Rx(UiState.none());

  Future<void> getCategoryList() async {
    categoryListState.value = UiState.loading();
    final res = await http.get(Uri.parse("$baseUrl/categories"));
    if (res.statusCode == 200) {
      try {
        final list = (jsonDecode(res.body) as List)
            .map((e) => CategoryItem.fromJson(e))
            .toList();
        categoryListState.value =UiState.success(list);
      } catch (e) {
        categoryListState.value =  UiState.error(e.toString()) ;
      }
    } else {
      categoryListState.value =  UiState.error(res.reasonPhrase ?? "Something Went wrong") ;
    }
  }
  void dispose() {
   categoryListState.dispose();
  }
/*  Future<void> getCategoryList() async {
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
  }*/
}
