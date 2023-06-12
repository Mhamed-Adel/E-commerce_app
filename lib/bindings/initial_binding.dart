import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/cart_controller.dart';
import 'package:test_app/controller/layout_controller/favorites_controller.dart';
import 'package:test_app/controller/layout_controller/product_controller.dart';

import '../controller/layout_controller/home_controller.dart';


class InitialBindings implements Bindings{
  @override
  void dependencies() {
    
    Get.put(HomeController());
    // Get.put(HomeController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => FavoritesController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => ProductController());
  }


}