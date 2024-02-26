import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:new_ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  /// Function to show Relevant screen
  screenRedirect() async {
    // local storage
    if(kDebugMode){
      print('========================== GET STORAGE AUTH REPO ========================== ');
      print(deviceStorage.read("isFirstTime"));
    }
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read("isFirstTime") != true ? Get.offAll(()=> const LoginScreen()):Get.offAll(()=> const OnBoardingScreen());
  }

  /* ------------------------------  Email & Password sing-in -------------------------------- */

  /// [EmailAuthentication] - SingIn

  /// [EmailAuthentication] - REGISTER

  /// [ReAuthenticate] - ReAuthenticate User

  /// [EmailVerification] - Mail Verification

  /// [EmailAuthentication] - Forget Password

  /* ------------------------------  Federated identity & social sing-in -------------------------------- */

  /// [GoogleAuthentication] - GOOGLE

  /// [FacebookAuthentication] - FACEBOOK

  /* ------------------------------  ./end Federated identity & social sing-in -------------------------------- */

  /// [LogoutUser] - Valid for any authentication

  /// DELETE USER - Remove user Auth and FireStore Account

}
