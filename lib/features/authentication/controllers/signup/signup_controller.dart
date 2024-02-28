import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ecommerce_app/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:new_ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:new_ecommerce_app/features/authentication/screens/singUp/verify_email.dart';
import 'package:new_ecommerce_app/utils/constants/image_strings.dart';
import 'package:new_ecommerce_app/utils/popups/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable for hiding / showing password
  final privacyPolicy = false.obs; // Observable for Privacy Policy acceptance
  final email = TextEditingController(); // Controller for email input
  final firstName = TextEditingController(); // Controller for first name input
  final lastName = TextEditingController(); // Controller for last name input
  final userName = TextEditingController(); // Controller for user name input
  final password = TextEditingController(); // Controller for password input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  ///  -- SIGNUP
  Future<void> signup() async {
    signupFormKey.currentState!.validate();
    Get.focusScope!.unfocus();
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImage.success);

      // CheckInternet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
      //   TFullScreenLoader.stopLoading();
      //
      // }else{
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
      //   TFullScreenLoader.stopLoading();
      //
      // }else{
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        print("===========================************* yes");
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'in order to create account, you must have to read and accept the Privacy & Terms of Use.',
        );
        TFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authentication & save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the firebase Fire store
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //TFullScreenLoader.stopLoading();


      // Show Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');

      // Move to Verify Email Screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));

   } catch (e) {
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
