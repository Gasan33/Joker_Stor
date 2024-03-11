import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:new_ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:new_ecommerce_app/features/personalization/screens/profile/profile.dart';
import 'package:new_ecommerce_app/utils/constants/image_strings.dart';
import 'package:new_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:new_ecommerce_app/utils/popups/loaders.dart';

import '../../../utils/helpers/network_manager.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstName=TextEditingController();
  final lastName=TextEditingController();
  final userController =UserController.instance;
  final userRepository=Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey= GlobalKey<FormState>();



  /// init user data when Home Screen appears
  @override
  void onInit() {
  initializeNames();
  super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async{
    firstName.text=userController.user.value.firstName;
    lastName.text=userController.user.value.lastName;
  }

  Future<void> updateUserName() async{
    try{
      // Start Loading
      TFullScreenLoader.openLoadingDialog('We are updating your information...', TImage.loader);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //   TFullScreenLoader.stopLoading();
        //
        // }else{
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        //
        // }else{
        return;
      }

      // Update user's first name in the FireBase FireStore
      Map<String,dynamic> name ={'FirstName':firstName.text.trim(),'LastName':lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName=firstName.text.trim();
      userController.user.value.lastName=lastName.text.trim();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title: 'Congratulations',message: 'Your Name has been updated.');

      // Move to previous screen
      Get.off(()=> const ProfileScreen());
    }
        catch (e){
          // Remove Loader
          TFullScreenLoader.stopLoading();
          TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());

        }
  }

}