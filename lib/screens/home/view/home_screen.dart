import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lingopanda_assignment/core/constants/stringconstants.dart';
import 'package:lingopanda_assignment/core/constants/theme.dart';
import 'package:lingopanda_assignment/screens/home/view/widgets/product_card.dart';
import 'package:lingopanda_assignment/screens/home/viewmodel/home_viewModel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    final HomeProvider = Provider.of<HomeViewModel>(context);
    final products = HomeProvider.products;

    debugPrint("${context.watch<User?>()}");

    Widget homeBodyWidget;

    if (HomeProvider.fetchProductsLoading) {
      // api in progress

      homeBodyWidget = const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (HomeProvider.products == null) {
        // Api failed
        homeBodyWidget = Center(
          child: Text(
            StringConstants.defaultErrorMessage,
            style: TextStyles.poppinBold.copyWith(
              color: ColorConstants.textShadeColor,
            ),
          ),
        );
      } else if (HomeProvider.products!.isEmpty) {
        // Show a widget that no products available
        homeBodyWidget = Center(
          child: Text(
            StringConstants.noProductsAvailable,
            style: TextStyles.poppinBold.copyWith(
              color: ColorConstants.textShadeColor,
            ),
          ),
        );
      } else {
        final widget = SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ProductCard(
                  product: products![index],
                  showDiscountedPrice: HomeProvider.showDiscountedPrice,
                );
              },
              childCount: products?.length ?? 0,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 170 / 260,
              crossAxisSpacing: 12,
              // mainAxisSpacing: MethodConstants.scaleMinHeight(height: 24),
              mainAxisSpacing: 12,
              // mainAxisSpacing: MethodConstants.scaleMinHeight(height: 24),
            ),
          ),
        );

        homeBodyWidget = SafeArea(
          child: CustomScrollView(
            slivers: [
              widget
            ],
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.blueShadeColor,
        title: Text(
          StringConstants.eShop,
          style: TextStyles.poppinBold.copyWith(
            color: ColorConstants.white,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: homeBodyWidget,
    );
  }
}
