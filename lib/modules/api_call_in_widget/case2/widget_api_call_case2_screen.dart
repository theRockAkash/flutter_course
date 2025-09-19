import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/common/models/category_item.dart';
import 'package:flutter_course/utils/constants.dart';
import 'package:flutter_course/widgets/loader.dart';
import 'package:http/http.dart' as http;

import '../../../widgets/category_list_widget.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

/// All code in single file - widget, apis, data
/// instead of setState, use ValueNotifier
class WidgetApiCallCase2Screen extends StatefulWidget {
  const WidgetApiCallCase2Screen({super.key});

  @override
  State<WidgetApiCallCase2Screen> createState() =>
      _WidgetApiCallCase2ScreenState();
}

class _WidgetApiCallCase2ScreenState extends State<WidgetApiCallCase2Screen> {
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<String?> error = ValueNotifier(null);
  ValueNotifier<List<CategoryItem>?> categoryList = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    getCategoryList();
  }

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

  @override
  void dispose() {
     isLoading.dispose();
     error.dispose();
     categoryList.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widget API CallCase 2 Example")),
      // isLoading?CustomLoader():categoryList!=null?CategoryListWidget(list:categoryList!):Text(error ?? "Invalid State")
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: isLoading,
            builder: (context, value, child) {
              if (isLoading.value) {
                return CustomLoader();
              }
              return SizedBox.shrink();
            },
          ),

          Expanded(
            child: ValueListenableBuilder(
              valueListenable: categoryList,
              builder: (context, value, child) {
                if (categoryList.value != null) {
                  return CategoryListWidget(list: categoryList.value!);
                }
                return SizedBox.shrink();
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: error,
            builder: (context, value, child) {
              if (error.value != null) {
                return Text(error.value ?? "Invalid State");
              }
              return SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
