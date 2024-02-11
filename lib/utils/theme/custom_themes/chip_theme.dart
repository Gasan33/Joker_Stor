import 'package:flutter/material.dart';

class TChipTheme{
  TChipTheme._();

/// Customizable Light Chip Theme
 static ChipThemeData lightChipTheme =ChipThemeData(
   deleteIconColor: Colors.grey.withOpacity(0.4),
   labelStyle: const TextStyle(color: Colors.black),
   selectedColor: Colors.blue,
   padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
   checkmarkColor: Colors.white,
 );

  /// Customizable Dark Chip Theme
  static ChipThemeData darkChipTheme =ChipThemeData(
    deleteIconColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
    checkmarkColor: Colors.white,
  );
}