import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_ecommerce_app/common/widgets/login_sing_up_widgets/form_divider.dart';
import 'package:new_ecommerce_app/common/widgets/login_sing_up_widgets/social_buttons.dart';
import 'package:new_ecommerce_app/features/authentication/screens/singup/widgets/sing_up_form.dart';
import 'package:new_ecommerce_app/utils/constants/colors.dart';
import 'package:new_ecommerce_app/utils/constants/text_strings.dart';
import 'package:new_ecommerce_app/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(TTexts.singUpTitle,style: Theme.of(context).textTheme.headlineMedium,),
const SizedBox(height: TSizes.spaceBtwItems,),
              /// Form
             TSingUpForm(),
              const SizedBox(height: TSizes.spaceBtwSections,),


              /// Or SingUP With
              TFormDivider(dividerText: TTexts.orSingUpWith.capitalize!),

              const SizedBox(height: TSizes.spaceBtwSections,),

              /// Social Button
             const TSocialButtons(

              ),

            ],
          ),
        ),
      ),
    );
  }
}

