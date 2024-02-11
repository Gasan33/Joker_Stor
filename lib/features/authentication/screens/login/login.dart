import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ecommerce_app/common/styles/spacing_styles.dart';
import 'package:new_ecommerce_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:new_ecommerce_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';
import 'package:new_ecommerce_app/utils/constants/text_strings.dart';
import '../../../../common/widgets/login_sing_up_widgets/form_divider.dart';
import '../../../../common/widgets/login_sing_up_widgets/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo Title & Sub-Title
            const TLoginHeader(),

              /// Form
             const TLoginForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSingInWith.capitalize!),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Footer
             const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}



