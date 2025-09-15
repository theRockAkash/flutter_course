import 'package:flutter/material.dart';

import '../data/category_item.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key, required this.list});

  final List<CategoryItem> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 8,),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return ListTile(
          leading: Image.network(
            item.image ?? "",
            errorBuilder: (context, error, stackTrace) => CircleAvatar(),
          ),
          title: Text(item.name ?? ""),
        );
      },
    );
  }
}
