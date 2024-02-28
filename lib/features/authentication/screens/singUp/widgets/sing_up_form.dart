import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_ecommerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:new_ecommerce_app/features/authentication/screens/singUp/widgets/terms_and_conditions_check_box.dart';
import 'package:new_ecommerce_app/utils/vaildators/vaildation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSingUpForm extends StatelessWidget {
  const TSingUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  validator: (value) =>
                      TValidator.validateEmptyText('First Name', value!),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputField,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  validator: (value) =>
                      TValidator.validateEmptyText('Last Name', value!),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),

          /// Username
          TextFormField(
            controller: controller.userName,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.userName,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
            validator: (value) =>
                TValidator.validateEmptyText('Username', value!),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),

          /// Email
          TextFormField(
            controller: controller.email,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
            validator: (value) => TValidator.validateEmail(value!),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
            validator: (value) => TValidator.validatePhoneNumber(value!),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value?Iconsax.eye_slash:Iconsax.eye),
                ),
              ),
              validator: (value) => TValidator.validatePassword(value!),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// TermConditions CheckBox
          const TTermsAndConditionCheckBox(),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// SIng Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
