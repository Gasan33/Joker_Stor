import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_ecommerce_app/common/styles/shadows.dart';
import 'package:new_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:new_ecommerce_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:new_ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:new_ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:new_ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:new_ecommerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:new_ecommerce_app/utils/constants/colors.dart';
import 'package:new_ecommerce_app/utils/constants/image_strings.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';
import 'package:new_ecommerce_app/utils/helpers/helper_functions.dart';

import '../../icons/circular_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    /// Container With Side Padding , Color , Edges , Radius and Shadow
    return GestureDetector(
      onTap: ()=> Get.to(()=>const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail WishList Button Discount Tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  const TRoundedImage(
                    imageUrl: TImage.productImage4,
                    width: double.infinity,
                    applyImageRadius: true,
                  ),

                  /// -- Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  /// -- Favourite Icon Button
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ),),
                ],
              ),
            ),

            ///  -- Details
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(
                      title: 'Green Nike Air Shoes',
                      smallSize: true,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TBrandTitleTextWithVerifiedIcon(title: 'Nike'),


                  ],
                ),
              ),
            ),
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(
                    price: '35.0',
                    // isLarge: true,
                  ),
                ),

                /// Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight:
                      Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(
                            Iconsax.add,
                            color: TColors.white,
                          ),),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

