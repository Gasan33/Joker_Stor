import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:new_ecommerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:new_ecommerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:new_ecommerce_app/utils/constants/image_strings.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_header.dart';
import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// -- SearchBar
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// -- Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        /// --Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                   SizedBox(height: TSizes.spaceBtwSections,),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  const TPromoSlider(
                    banners: [
                      TImage.promoBanner1,
                      TImage.promoBanner2,
                      TImage.promoBanner3,
                    ],
                  ),

                  /// -- Heading
                   TSectionHeading(title: 'Popular Products',onPressed: (){} ,),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// -- Popular Products
                  TGridLayout(
                    itemCount: 4,
                    itemBuilder:(_,index)=> const TProductCardVertical() ,
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


