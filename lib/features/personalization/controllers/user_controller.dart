import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:new_ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:new_ecommerce_app/features/personalization/models/user_model.dart';
import 'package:new_ecommerce_app/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // Convert Name to First And Last
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final userName =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length>1?nameParts.sublist(1).join(" "):'',
          userName: userName,
          email: userCredential.user!.email?? '',
          phoneNumber: userCredential.user!.phoneNumber?? '',
          profilePicture: userCredential.user!.photoURL?? '',
        );

        // Save user Data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not Saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }
}
