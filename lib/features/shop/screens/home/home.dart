import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:new_ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:new_ecommerce_app/utils/constants/colors.dart';
import 'package:new_ecommerce_app/utils/constants/text_strings.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/products_cart/cart_menu_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  THomeAppBar(),

                  /// -- SearchBar
                  /// -- Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


