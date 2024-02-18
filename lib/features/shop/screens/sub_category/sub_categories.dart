import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:new_ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:new_ecommerce_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:new_ecommerce_app/common/widgets/texts/section_header.dart';
import 'package:new_ecommerce_app/utils/constants/image_strings.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Sport shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(
                width: double.infinity,
                height: null,
                imageUrl: TImage.promoBanner6,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Sub_Categories
              Column(
                children: [
                  /// Heading
                  TSectionHeading(
                    title: 'Sport shirt',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context,index)=>const SizedBox(width: TSizes.spaceBtwItems,),
                      itemBuilder: (BuildContext context, int index) {
                        return const TProductCardHorizontal();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
