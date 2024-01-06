import 'package:assignment/database/model/product_model.dart';
import 'package:assignment/features/home/widgets/product_rate_card.dart';
import 'package:assignment/navigation/page_routes.dart';
import 'package:assignment/utils/constants/app_text_styles.dart';
import 'package:assignment/utils/constants/image_path.dart';
import 'package:assignment/utils/helper_methods.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// StatelessWidget for displaying a product card with image, brand, description, and price
class ProductCard extends StatelessWidget {
  // Product object representing the details of the card
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // InkWell for making the card tappable, navigating to the product details screen on tap
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PageRoutes.productDetailsScreen,
            arguments: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container for the product image with shadow and border radius
          Container(
            margin: const EdgeInsets.only(bottom: 7),
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              // Displaying the product image from the network
              child: CachedNetworkImage(
                imageUrl:
                    "${product.looksImageUrl ?? ImagePath.sampleNetworkImage}",
                errorWidget: (context, url, error) =>
                    Image.asset(ImagePath.sampleImage),
                height: 230,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Displaying the brand name of the product
          Text(
            HelperMethods.stringExtract(product.brand),
            style: AppTextStyles.f12W500Black87,
          ),
          const SizedBox(
            height: 5,
          ),
          // Displaying the description of the product with maximum 2 lines
          Text(
            HelperMethods.stringExtract(product.description),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.f12W400Black54,
          ),
          const SizedBox(
            height: 5,
          ),
          // Displaying the product rate card with the price
          ProductRateCard(price: product.mrp ?? 0),
        ],
      ),
    );
  }
}
