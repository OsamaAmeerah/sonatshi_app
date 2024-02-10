import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

 HexColor mainLightColor = HexColor('#2A3C4B');
HexColor welcomeScreenColor = HexColor('#24425A');
HexColor mainBackDarkColor = HexColor('333739');
HexColor primaryDarkColor = HexColor('#3C566C');
HexColor darkBlueCl = HexColor('#24425A');
const Color kCOlor1 = Color(0xff685959);
const Color kCOlor2 = Color(0xffADA79B);
const Color kCOlor3 = Color(0xffA5947F);
const Color kCOlor4 = Color(0xff738B71);
const Color kCOlor5 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainBackDarkColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: mainBackDarkColor,
    backgroundColor: mainBackDarkColor,
    brightness: Brightness.dark,
  );
}
