
import 'package:flutter_course/di/controller_store.dart';
import 'package:flutter_course/modules/home/ui/home_controller.dart';

import '../modules/home/ui/home_screen.dart';
import '../modules/product/ui/detail/product_detail_controller.dart';
import '../modules/product/ui/detail/product_detail_screen.dart';
import 'app_screens.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

final appRoutes = {
  AppScreens.home: (context) {
    ControllerStore.lazyPut<HomeController>(() => HomeController());
   return HomeScreen();
  },
 AppScreens.productDetail: (context) {
    ControllerStore.lazyPut<ProductDetailController>(() => ProductDetailController());
   return ProductDetailScreen();
  },

};
