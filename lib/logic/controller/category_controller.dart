import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sonatshi/model/product_model.dart';
import 'package:sonatshi/services/category_services.dart';

class CategoryController extends GetxController{

  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategoryLoading = false.obs;

  var categoryList = <ProductModel>[].obs;

  List<String> imageCategory = [
    'assets/images/electronics.jpg',
    'assets/images/jewelery.jpg',
    'assets/images/mens.jpg',
    'assets/images/womens.jpg',
  ];



  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  void getCategories()async{
    var categoryName = await CategoryServices.getCategory();
    try{
      isCategoryLoading(true);
      if(categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    }finally{
    isCategoryLoading(false);

  }

  }

   getAllCategories(String nameCategory)async {
    isAllCategoryLoading(true);
    categoryList.value =   await AllCategoryServices.getAllCategory(nameCategory);
    isAllCategoryLoading(false);
  }





  getCategoryIndex(int index) async{
    var categoryAllName = await getAllCategories(categoryNameList[index]);

    if(categoryAllName.isNotEmpty) {
      categoryList.value = categoryAllName;
    }
  }


}