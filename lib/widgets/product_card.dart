import 'package:flutter/material.dart';
import 'package:flutter_course/modules/standard/models/product.dart';

/// @Created by akash on 19-09-2025.
/// Know more about author at https://akash.cloudemy.in

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.item});

  final Product item;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            item.images?.firstOrNull ?? "",
            errorBuilder: (context, error, stackTrace) => CircleAvatar(),
          ),
          Text("\$${item.price}" ),
          Text(item.title ?? "",maxLines: 1,overflow: TextOverflow.ellipsis, ),
          Text(item.category?.name ?? "",maxLines: 1,overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
