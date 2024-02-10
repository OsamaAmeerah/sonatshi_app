import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sonatshi/logic/controller/theme_controller.dart';
import 'package:sonatshi/routes/routes.dart';
import 'package:get/get.dart';
import 'package:sonatshi/utils/constants.dart';
import 'package:sonatshi/utils/my_string.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'language/localiztion.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang').toString()),
      fallbackLocale: Locale(ene),
      translations: LocaliztionApp(),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().getThemeData,
      initialRoute:
      fireAuth.currentUser != null || GetStorage().read<bool>('auth') == true
          ? AppRoutes.mainScreen
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}