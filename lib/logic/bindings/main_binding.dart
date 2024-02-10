import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/main_screen_controller.dart';
import 'package:sonatshi/logic/controller/settings_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {

    Get.put(MainScreenController());
    Get.put(SettingsController());

  }

}