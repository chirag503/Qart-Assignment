import 'package:assignment/utils/constants/app_text_styles.dart';
import 'package:assignment/utils/helper_methods.dart';
import 'package:flutter/material.dart';

// StatelessWidget for displaying a product rate card with discounted price, MRP, and discount percentage
class ProductRateCard extends StatelessWidget {
  // Price of the product
  final num price;
  // Flag indicating whether the card is for a product detail screen
  final bool forproductDetail;
  const ProductRateCard(
      {super.key, required this.price, this.forproductDetail = false});

  @override
  Widget build(BuildContext context) {
    // Row widget to arrange the components horizontally
    return Row(
      children: [
        // Displaying the discounted price using HelperMethods
        Text(
          HelperMethods().discountPrice(price),
          style: AppTextStyles.f14W500Black
              .copyWith(fontSize: !forproductDetail ? 16 : 14),
        ),
        const SizedBox(
          width: 6,
        ),
        // RichText to display MRP with a strikethrough effect
        RichText(
          text: TextSpan(
            text: forproductDetail ? "MRP " : "",
            style: AppTextStyles.f14W500Grey
                .copyWith(fontSize: !forproductDetail ? 16 : 14),
            children: [
              // Actual price with a strikethrough effect
              TextSpan(
                text: HelperMethods().actualPrice(price),
                style: AppTextStyles.f14W500Grey.copyWith(
                  fontSize: !forproductDetail ? 16 : 14,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        // Displaying the discount percentage
        Text(
          "50% off",
          style: AppTextStyles.f14W500Green
              .copyWith(fontSize: !forproductDetail ? 16 : 14),
        ),
      ],
    );
  }
}
