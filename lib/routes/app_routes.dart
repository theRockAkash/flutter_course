
import 'package:flutter_course/di/controller_store.dart';
import '../presentation/home/home_controller.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/product/detail/product_detail_controller.dart';
import '../presentation/product/detail/product_detail_screen.dart';
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
