import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_ecommerce_app/common/widgets/texts/section_header.dart';
import 'package:new_ecommerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:new_ecommerce_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:new_ecommerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:new_ecommerce_app/features/shop/screens/product_details/widgets/products_attributes.dart';
import 'package:new_ecommerce_app/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Product Image Slider
            const TProductImageSlider(),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// -- Rating & Share Button
                  const TRatingAndShare(),

                  /// -- Price , Title ,Stock , Brand
                  const TProductMetaData(),
                  /// -- Attributes
                  const TProductsAttributes(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  /// -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                      child: ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// -- Description
                  const TSectionHeading(title: 'Description',showActionButton: false,),

                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                      'American athletic footwear and apparel corporation headquartered near Beaverton, Oregon, United States. It is the worlds largest supplier of athletic shoes and apparel and a major manufacturer of sports equipment, with revenue in excess of US\$46 billion in its fiscal year 2022.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),

                  ),

                  /// -- Reviews
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews (199)',showActionButton: false,),
                      IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_3,size: 18,),),
                    ],
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

