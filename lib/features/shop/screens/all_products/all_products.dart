import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:new_ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:new_ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:new_ecommerce_app/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// DropDown
              DropdownButtonFormField(
                  decoration:
                      const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                  items: [
                    'Name',
                    'Higher Price',
                    'Lower Price',
                    'Sale',
                    'Newest',
                    'Popularity'
                  ]
                      .map((option) =>
                          DropdownMenuItem(value: option, child: Text(option)))
                      .toList(),
                  onChanged: (value) {}),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Products
              TGridLayout(
                  itemCount: 8,
                  itemBuilder: (_,index)=>const TProductCardVertical(

                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
