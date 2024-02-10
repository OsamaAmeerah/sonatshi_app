import 'package:get/get.dart';
import 'package:sonatshi/view/screens/category_screen.dart';
import 'package:sonatshi/view/screens/favorites_screen.dart';
import 'package:sonatshi/view/screens/home_screen.dart';
import 'package:sonatshi/view/screens/settings_screen.dart';

class MainScreenController extends GetxController{

 RxInt currentIndex = 0.obs;

 final tabs = [
   HomeScreen(),
  const CategoryScreen(),
   FavoriteScreen(),
  const SettingsScreen(),
 ].obs;

 final title = [
  'Products',
  'Categories',
  'Favorites',
  'Settings'
 ].obs;


}