import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sonatshi/utils/my_string.dart';

class SettingsController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var localLang = ene;
  String capitalize(String profileName) {
    return profileName.split(' ').map((name) => name.capitalize).join(' ');
  }

  //language

  @override
  void onInit() async {
    localLang = await getLanguage;
    super.onInit();
  }

  void saveLanguage(String lang) async {
    await storage.write('lang', lang);
  }

  Future<String> get getLanguage async {
    return await storage.read('lang');
  }

  void changeLanguage(String lang) {
    saveLanguage(lang);
    if (localLang == lang) {
      return;
    }

    if (lang == frf) {
      localLang = frf;
      saveLanguage(frf);
    } else if (lang == ara) {
      localLang = ara;
      saveLanguage(ara);
    } else {
      localLang = ene;
      saveLanguage(ene);
    }

    update();
  }
}
