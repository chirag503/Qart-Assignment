import 'package:assignment/database/model/product_model.dart';
import 'package:assignment/features/home/widgets/product_rate_card.dart';
import 'package:assignment/navigation/page_routes.dart';
import 'package:assignment/utils/constants/app_text_styles.dart';
import 'package:assignment/utils/constants/image_path.dart';
import 'package:assignment/utils/helper_methods.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// Widget representing a card for displaying product information in search results
class SearchProductCard extends StatelessWidget {
  // Product instance to display information
  final Product product;

  const SearchProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // InkWell for handling tap gestures on the card
      onTap: () {
        // Navigate to the detailed product screen when tapped
        Navigator.pushNamed(context, PageRoutes.productDetailsScreen,
            arguments: product);
      },
      // Container representing the card with styling and layout
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        // Column for organizing content vertically within the card
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for organizing content horizontally within the card
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Expanded widget for the product image
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl:
                          "${product.looksImageUrl ?? ImagePath.sampleNetworkImage}",
                      errorWidget: (context, url, error) =>
                          Image.asset(ImagePath.sampleImage),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                // Expanded widget for the product details
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // Column for organizing content vertically within the product details
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product name
                        Text(HelperMethods.stringExtract(product.name),
                            style: AppTextStyles.f14W500Black),
                        const SizedBox(
                          height: 5,
                        ),
                        // RichText for displaying QR code information
                        RichText(
                            text: TextSpan(
                                text: "QR: ",
                                style: AppTextStyles.f14W500Black,
                                children: [
                              TextSpan(
                                  text: HelperMethods.stringExtract(
                                      product.qrCode),
                                  style: AppTextStyles.f14W500Black54)
                            ])),
                        const SizedBox(
                          height: 5,
                        ),
                        // RichText for displaying option information
                        RichText(
                            text: TextSpan(
                                text: "OP: ",
                                style: AppTextStyles.f14W500Black,
                                children: [
                              TextSpan(
                                  text: HelperMethods.stringExtract(
                                      product.option),
                                  style: AppTextStyles.f14W500Black54)
                            ])),
                        const SizedBox(
                          height: 5,
                        ),
                        // Widget for displaying product rate
                        ProductRateCard(price: product.mrp ?? 0),
                        const SizedBox(
                          height: 5,
                        ),
                        // Row for displaying product size information
                        Row(
                          children: [
                            Text("Size: ", style: AppTextStyles.f14W500Black),
                            // Flexible widget for handling size information overflow
                            Flexible(
                              child: Text(product.ean?.keys.join(", ") ?? "--",
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.f14W500Black54),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
