import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:new_ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:new_ecommerce_app/common/widgets/texts/section_header.dart';
import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding:const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
             const TBrandShowCase(
                images: [
                  TImage.productImage1,
                  TImage.productImage2,
                  TImage.productImage3,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// -- Products
              TSectionHeading(title: 'You might like',onPressed: (){},),


              TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_,index)=>const TProductCardVertical(),

              ),
              const SizedBox(height: TSizes.spaceBtwItems,),

            ],
          ),
        ),
      ],
    );
  }
}
