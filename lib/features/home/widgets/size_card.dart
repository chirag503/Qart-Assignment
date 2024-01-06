import 'package:flutter/material.dart';

// StatelessWidget for displaying a size card with a specific title
class SizeCard extends StatelessWidget {
  // Title representing the size
  final String title;

  const SizeCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 36,
      width: 38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          // Adding a subtle box shadow for a lifted appearance
          BoxShadow(
            color: Colors.blueGrey,
            blurRadius: 0.3,
            spreadRadius: 0.001,
            offset: Offset(0.9, 0.9),
          ),
        ],
      ),
      // Centering the size text within the container
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
