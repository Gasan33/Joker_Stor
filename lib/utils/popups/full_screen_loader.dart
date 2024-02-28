import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ecommerce_app/utils/constants/colors.dart';
import 'package:new_ecommerce_app/utils/helpers/helper_functions.dart';

import '../../common/widgets/loaders/animation_loader.dart';

/// A utility Class for managing a full-screen loading dialog
class TFullScreenLoader {
  /// open a full-screen loading dialog with a given text and animation
  /// this method doesn't return anything
  ///
  ///  Parameters:
  ///    - text : The text to be displayed in the loading dialog
  ///    - animation : The Lottie animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => Container(
        color: THelperFunctions.isDarkMode(Get.context!)
            ? TColors.dark
            : TColors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 256,
            ),
            TAnimationLoaderWidget(text: text, animation: animation),
          ],
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog
  /// This method doesn't return anything
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
