import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/cart_controller.dart';
import 'package:sonatshi/logic/controller/category_controller.dart';
import 'package:sonatshi/logic/controller/product_controller.dart';

class ProductBindings extends Bindings{
  @override
  void dependencies() {
      Get.put(ProductController());
      Get.lazyPut(() => CartController());
      Get.put(CategoryController());
  }

}