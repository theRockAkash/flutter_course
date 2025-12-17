import 'package:flutter/material.dart';

import '../../data/models/category_item.dart';


/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

class CategoryGridWidget extends StatelessWidget {
  const CategoryGridWidget({super.key, required this.list});

  final List<Category> list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return Column(
          children: [
            Expanded(
              child: Image.network(
                item.image ?? "",
                errorBuilder: (context, error, stackTrace) => CircleAvatar(),
              ),
            ),
            Text(item.name ?? "", textAlign: TextAlign.center),
          ],
        );
      },
    );
  }
}
