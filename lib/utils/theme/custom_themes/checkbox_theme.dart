import 'package:flutter/material.dart';

class TCheckboxTheme{
  TCheckboxTheme._();

/// Customizable Light Checkbox Theme
 static CheckboxThemeData lightCheckboxTheme=CheckboxThemeData(
   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
   checkColor: MaterialStateProperty.resolveWith((states) {
     if(states.contains(MaterialState.selected)){
       return Colors.white;
     }else{
       return Colors.black;
     }
   }),
   fillColor: MaterialStateProperty.resolveWith((states) {
   if(states.contains(MaterialState.selected)){
     return Colors.blue;
   }else{
     return Colors.transparent;
   }
 }),
 );

  /// Customizable Dark Checkbox Theme
  static CheckboxThemeData darkCheckboxTheme=CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return Colors.white;
      }else{
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return Colors.blue;
      }else{
        return Colors.transparent;
      }
    }),
  );
}