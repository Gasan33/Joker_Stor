import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ecommerce_app/utils/constants/colors.dart';
import 'package:new_ecommerce_app/utils/theme/theme.dart';

/// -- Use This Class To Setup Themes , initialize Binding , any Animations and much more ---------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const Scaffold(backgroundColor: TColors.primary,body: Center(child: CircularProgressIndicator(color: TColors.white,),),),
    );
  }
}