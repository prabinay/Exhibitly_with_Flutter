import 'package:flutter/material.dart';

Color mains = Color(0xffF35383);

class ColorManager {
  static Color KPrimaryColor = HexColor.fromHex("A04732");
  static Color KSecondaryColor = HexColor.fromHex("EDEBE3");
  static Color KTextColor = HexColor.fromHex("#263238");
  static Color kError = HexColor.fromHex("#dc3545");
  static Color kSuccess = HexColor.fromHex("#dc3545");


  
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opactiy 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}