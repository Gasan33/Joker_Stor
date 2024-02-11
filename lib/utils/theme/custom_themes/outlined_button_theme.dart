import 'package:flutter/material.dart';

class TOutlinedButtonTheme{
  TOutlinedButtonTheme._();

/// Customizable Light OutlinedButton Theme
 static final lightOutlinedButtonTheme=OutlinedButtonThemeData(
   style: OutlinedButton.styleFrom(
     elevation: 0,
     foregroundColor: Colors.black,
     side: const BorderSide(color: Colors.blue),
     textStyle: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.black),
     padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 20.0),
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
   ),
 );

  /// Customizable Dark OutlinedButton Theme
  static final darkOutlinedButtonTheme=OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.blue),
      textStyle: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
    ),
  );
}