import 'package:flutter/material.dart';

class ColorManager {
  static Color KPrimaryColor = HexColor.fromHex("A04732");
  static Color KSecondaryColor = HexColor.fromHex("EDEBE3");
  static Color KTextColor = HexColor.fromHex("#263238");


  
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