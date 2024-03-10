import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ecommerce_app/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:new_ecommerce_app/utils/constants/image_strings.dart';
import 'package:new_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:new_ecommerce_app/utils/popups/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../screens/password_configration/reset_password.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email =TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey =GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try{
      // Start Loading
      TFullScreenLoader.openLoadingDialog("Processing your request...", TImage.loader);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        //
        // }else{
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(title: 'Email Sent',message: "Email Link Sent to Reset your Password".tr);

      // Redirect
      Get.to(()=> ResetPasswordScreen(email:email.text.trim()));

    }catch (e){
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());

    }
  }

  resendPasswordResetEmail(String email)async{
    try{
      // Start Loading
      TFullScreenLoader.openLoadingDialog("Processing your request...", TImage.loader);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        //
        // }else{
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(title: 'Email Sent',message: "Email Link Sent to Reset your Password".tr);


    }catch (e){
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}