import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/data/category_item.dart';
import 'package:flutter_course/utils/constants.dart';
import 'package:flutter_course/widgets/loader.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/category_list_widget.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

class WidgetApiCallScreen extends StatefulWidget {
  const WidgetApiCallScreen({super.key});

  @override
  State<WidgetApiCallScreen> createState() => _WidgetApiCallScreenState();
}

class _WidgetApiCallScreenState extends State<WidgetApiCallScreen> {
  var isLoading = false;
  String? error;
  List<CategoryItem>? categoryList;

  @override
  void initState() {
    super.initState();
    getCategoryList();
  }

  Future<void> getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    final res = await http.get(Uri.parse("$baseUrl/categories"));
    if (res.statusCode == 200) {
      error = null;
      isLoading = false;
      try {
        categoryList = (jsonDecode(res.body) as List)
            .map((e) => CategoryItem.fromJson(e))
            .toList();
      } catch (e) {
        error = e.toString();
      }
    } else {
      isLoading = false;
      categoryList = null;
      error = res.reasonPhrase ?? "Something Went wrong";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widget API Call Example")),
      // isLoading?CustomLoader():categoryList!=null?CategoryListWidget(list:categoryList!):Text(error ?? "Invalid State")
      body: Column(
        children: [
          if (isLoading)
            Expanded(child: CustomLoader())
          else if (categoryList != null)
            Expanded(child: CategoryListWidget(list: categoryList!))
          else
            Expanded(child: Text(error ?? "Invalid State")),
        ],
      ),
    );
  }
}
