import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:new_ecommerce_app/common/widgets/texts/section_header.dart';
import 'package:new_ecommerce_app/utils/constants/colors.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed:(){} ,
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark?TColors.light:TColors.white,
              padding:const EdgeInsets.all(TSizes.sm),
              child: const Image(image: AssetImage( TImage.paypal),fit: BoxFit.contain,),
            ),
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            Text('Paypal',style: Theme.of(context).textTheme.bodyLarge,),

          ],
        )
      ],
    );
  }
}
