import 'package:flutter/material.dart';
import 'package:flutter_course/modules/standard/models/product.dart';
import 'package:flutter_course/modules/standard/ui/standard_api_controller.dart';

import '../../../widgets/category_grid_widget.dart';
import '../../../widgets/loader.dart';
import '../../../widgets/product_card.dart';

/// @Created by akash on 19-09-2025.
/// Know more about author at https://akash.cloudemy.in

class StandardApiScreen extends StatelessWidget {
  const StandardApiScreen({super.key, required this.controller});

  final StandardApiController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Standard API Example")),
      body: RefreshIndicator(
         onRefresh: () => controller.getProducts(),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            Divider(),
            controller.categoryListState.onChange(
              builder: (value) {
                return value.when(
                  success: (data) => SizedBox(
                    height: 220,
                    child: CategoryGridWidget(list: data),
                  ),
                  error: (err) => Text(err),
                  loading: () => SizedBox(height: 220, child: CustomLoader()),
                  none: () => SizedBox(),
                );
              },
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Products",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            Divider(),
            controller.productListState.onChange(
              builder: (value) {
                return value.when(
                  success: (data) => productListWidget(list: data),
                  error: (err) => Text(err),
                  loading: () => SizedBox(
                    height: 250,
                      child: CustomLoader()),
                  none: () => SizedBox(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget productListWidget({required List<Product> list}) {
    return GridView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        childAspectRatio: .7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => ProductCard(item: list[index]),
    );
  }
}
