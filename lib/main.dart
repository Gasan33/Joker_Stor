import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_ecommerce_app/myapp.dart';
import 'package:new_ecommerce_app/utils/constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repositories/authentication_repository/authentication_repository.dart';
import 'firebase_options.dart';


/// ========= Entry Point Of Flutter App ----------
Future<void> main() async {

  /// -- Widgets Binding
  final WidgetsBinding widgetBinding= WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage
  await GetStorage.init();

  /// -- Await Native Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);


  /// -- initialize Firebase & Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));

  TColors.linerGradient;

  // Load all The Material Design / Theme / Localizations / Bindings
  runApp(const MyApp());
}





