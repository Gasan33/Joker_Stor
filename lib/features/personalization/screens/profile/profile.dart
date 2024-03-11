import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:new_ecommerce_app/common/widgets/images/circular_image.dart';
import 'package:new_ecommerce_app/common/widgets/texts/section_header.dart';
import 'package:new_ecommerce_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:new_ecommerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:new_ecommerce_app/utils/constants/image_strings.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';

import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImage.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// -- Details
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// -- Heading Profile Info

              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TProfileMenu(
                title: 'Name',

                value: controller.user.value.fullName,
                onPressed: () => Get.to(()=> const ChangeName()),
              ),TProfileMenu(
                title: 'Username',

                value: controller.user.value.userName,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// -- Heading Personal Info

              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),


              TProfileMenu(
                title: 'User ID',
                icon: Iconsax.copy,
                value: controller.user.value.id,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Date of Birth',
                value: '1 Feb, 1998',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Center(
                child: TextButton(
                  onPressed: ()=>controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
