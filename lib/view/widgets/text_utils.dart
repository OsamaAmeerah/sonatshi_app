import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextDecoration? decoration;

  const TextUtils({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
     this.decoration
  });
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          decoration: decoration ,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
