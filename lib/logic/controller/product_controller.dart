import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sonatshi/model/product_model.dart';
import 'package:sonatshi/services/product_services.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs;
  var productList = <ProductModel>[].obs;
  var favoriteList = <ProductModel>[].obs;
  var storage = GetStorage();

  //search
  var searchList = <ProductModel>[].obs;

  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    getProducts();
    List? storedShopping = storage.read<List>('isFavoriteList');
    if (storedShopping != null) {
      favoriteList =
          storedShopping.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProducts();

    super.onInit();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // favorites screen logic..
  void manageFavorites(int productId) async {
    var existingIndex =
        favoriteList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favoriteList.removeAt(existingIndex);
      await storage.remove('isFavoriteList');
    } else {
      favoriteList.add(
        productList.firstWhere((element) => element.id == productId),
      );
      Get.snackbar('Favorite', 'The product Added successfully',
          animationDuration: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 1200));
      await storage.write('isFavoriteList', favoriteList);
    }
  }

  bool isFavorite(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }

  // search bar logic

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList('');
  }
}
