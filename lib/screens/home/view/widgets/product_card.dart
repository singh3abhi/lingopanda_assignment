import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lingopanda_assignment/core/constants/theme.dart';
import 'package:lingopanda_assignment/screens/home/model/home_productsmodel.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.showDiscountedPrice});
  final Product product;
  final bool showDiscountedPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              color: Colors.white,
              height: 120,
              child: Image.network(
                product.thumbnail ?? '',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title ?? '',
                style: TextStyles.poppinBold.copyWith(
                  color: ColorConstants.textShadeColor,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                product.description ?? '',
                style: TextStyles.poppinMedium.copyWith(
                  color: ColorConstants.textShadeColor,
                  fontSize: 15,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          priceWidget(showDiscountedPrice: showDiscountedPrice),
        ],
      ),
    );
  }

  Widget priceWidget({required bool showDiscountedPrice}) {
    final price = product.price;
    final discountPercentage = product.discountPercentage;

    if (price == null || discountPercentage == null) return SizedBox();

    double discountAmount = (discountPercentage / 100) * price;
    double discountedPrice = price - discountAmount;

    return Wrap(
      children: [
        Text(
          "\$${product.price ?? ""}",
          style: TextStyles.poppinRegular.copyWith(
            color: ColorConstants.textShadeColor,
            fontSize: 11,
            fontStyle: FontStyle.italic,
            decoration: showDiscountedPrice ? TextDecoration.lineThrough : null,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        if (showDiscountedPrice) ...[
          const SizedBox(width: 6),
          Text(
            "\$${discountedPrice.toStringAsFixed(2)}",
            style: TextStyles.poppinBold.copyWith(
              color: ColorConstants.textShadeColor,
              fontSize: 11,
              fontStyle: FontStyle.italic,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: 6),
          Text(
            "${product.discountPercentage ?? ""} % off",
            style: TextStyles.poppinBold.copyWith(
              color: Colors.green.shade300,
              fontSize: 11,
              fontStyle: FontStyle.italic,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}
