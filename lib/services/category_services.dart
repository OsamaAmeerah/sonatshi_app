import 'package:http/http.dart' as http ;
import 'package:sonatshi/utils/my_string.dart';

import '../model/category_model.dart';
import '../model/product_model.dart';


class CategoryServices{

  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }
}


class AllCategoryServices{

  static Future<List<ProductModel>> getAllCategory(String categoryNames) async {
    var response = await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }

}