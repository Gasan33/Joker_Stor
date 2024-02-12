import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';

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


