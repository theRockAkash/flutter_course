import 'package:flutter/material.dart';
import 'product_detail_controller.dart';

import '../../../../di/controller_view.dart';

/// @Created by akash on 26-09-2025.
/// Know more about author at https://akash.cloudemy.in

class ProductDetailScreen extends ControllerView<ProductDetailController> {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("data")));
  }
}
