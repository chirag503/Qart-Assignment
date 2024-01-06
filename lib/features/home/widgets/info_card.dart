import 'package:assignment/utils/helper_methods.dart';
import 'package:flutter/material.dart';

// StatelessWidget for displaying information cards with a title and subtitle
class InfoCard extends StatelessWidget {
  // Title and subtitle for the information card
  final String title;
  final String? subTitle;

  const InfoCard({super.key, required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Displaying the title with bold styling
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        // Displaying the subtitle with normal styling
        Text(
          HelperMethods.stringExtract(subTitle),
          style: const TextStyle(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
