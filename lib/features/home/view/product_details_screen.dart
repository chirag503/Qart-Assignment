import 'package:assignment/database/model/product_model.dart';
import 'package:assignment/features/home/widgets/info_card.dart';
import 'package:assignment/features/home/widgets/product_card.dart';
import 'package:assignment/features/home/widgets/product_rate_card.dart';
import 'package:assignment/features/home/widgets/size_card.dart';
import 'package:assignment/utils/constants/app_text_styles.dart';
import 'package:assignment/utils/constants/image_path.dart';
import 'package:assignment/utils/helper_methods.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// StatelessWidget for displaying details of a specific product
class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with product name as the title
      appBar: AppBar(
        leadingWidth: 30,
        elevation: 1,
        backgroundColor: Colors.black45,
        title: Text(
          HelperMethods.stringExtract(product.name),
          style: AppTextStyles.f24W500White,
        ),
      ),
      // Body of the screen using SingleChildScrollView to allow scrolling
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Stack to display the product image with likeability rating
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                    "${product.looksImageUrl ?? ImagePath.sampleNetworkImage}",
                errorWidget: (context, url, error) =>
                    Image.asset(ImagePath.sampleImage),
                height: 500,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Displaying likeability rating and icon
                        Text((product.likeabilty ?? 0.0).toString(),
                            style: AppTextStyles.f12W700Black),
                        const SizedBox(width: 2),
                        const Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 14,
                        ),
                        const SizedBox(width: 2),
                        Text("|", style: AppTextStyles.f12W700Black),
                        const SizedBox(width: 5),
                        Text(
                          "120",
                          style: AppTextStyles.f12W700Black,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          // Sections for displaying product details, description, size options, etc.
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Brand name, product name, and price card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Brand name
                    Text(
                        HelperMethods.stringExtract(product.brand)
                            .toUpperCase(),
                        style: AppTextStyles.f16W600Black160),
                    const SizedBox(height: 5),
                    // Product name
                    Text(
                      HelperMethods.stringExtract(product.name),
                      style: AppTextStyles.f16W600Black105,
                    ),
                    const SizedBox(height: 5),
                    // Price card
                    ProductRateCard(
                        forproductDetail: true, price: product.mrp ?? 0),
                  ]),
            ),
            // Divider for visual separation
            const Divider(
              color: Colors.black12,
              thickness: 8,
            ),
            // Description section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description:",
                    style: AppTextStyles.f16W600Black,
                  ),
                  const SizedBox(height: 5),
                  // Product description
                  Text(HelperMethods.stringExtract(product.description),
                      style: AppTextStyles.f16W600Black105),
                ],
              ),
            ),
            // Divider for visual separation
            const Divider(
              color: Colors.black12,
              thickness: 8,
            ),
            // Size options section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Size:",
                    style: AppTextStyles.f16W600Black,
                  ),
                  const SizedBox(height: 10),
                  // Displaying size options using Wrap widget
                  Wrap(
                    children: product.ean?.keys
                            .toList()
                            .map((e) => SizeCard(title: e))
                            .toList() ??
                        [],
                  ),
                ],
              ),
            ),
            // Divider for visual separation
            const Divider(
              color: Colors.black12,
              thickness: 8,
            ),
            // Product details section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Details:",
                    style: AppTextStyles.f16W600Black,
                  ),
                  const SizedBox(height: 20),
                  // Displaying product details using StaggeredGrid
                  StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    children: [
                      InfoCard(title: "Category:", subTitle: product.category),
                      InfoCard(
                          title: "Collection", subTitle: product.collection),
                      InfoCard(title: "Material", subTitle: product.material),
                      InfoCard(title: "Quality", subTitle: product.quality),
                      InfoCard(title: "Option", subTitle: product.option),
                      InfoCard(title: "QRCode", subTitle: product.qrCode),
                      InfoCard(title: "Gender:", subTitle: product.gender),
                      InfoCard(title: "Fit", subTitle: product.fit),
                      InfoCard(title: "Color:", subTitle: product.color),
                      InfoCard(title: "Fabric", subTitle: product.fabric),
                    ],
                  ),
                ],
              ),
            ),
            // Divider for visual separation
            const Divider(
              color: Colors.black12,
              thickness: 8,
            ),
            // Similar Products section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Similar Products",
                    style: AppTextStyles.f20W700Black,
                  ),
                  const SizedBox(height: 20),
                  // Displaying similar products using Wrap widget
                  Wrap(
                    spacing: 10,
                    runSpacing: 40,
                    children: List.generate(
                      30,
                      (index) => SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: ProductCard(product: product),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ])
        ]),
      ),
    );
  }
}
