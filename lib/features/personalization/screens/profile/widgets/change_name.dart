import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';
import 'package:new_ecommerce_app/utils/constants/text_strings.dart';
import 'package:new_ecommerce_app/utils/vaildators/vaildation.dart';

import '../../../controllers/update_name_controller.dart';
class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return  Scaffold(
      /// Custom Appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Change Name',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Headings
            Text(
              'Use real name foe easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            /// Text field and Button
            Form(
              key:controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value)=>TValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.firstName,prefixIcon: Icon(Iconsax.user)),

                  ),
                  const SizedBox(height: TSizes.spaceBtwInputField,),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value)=>TValidator.validateEmptyText('last name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.lastName,prefixIcon: Icon(Iconsax.user)),

                  ),

                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=>controller.updateUserName(),child: const Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
