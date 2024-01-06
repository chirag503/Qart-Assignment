import 'package:assignment/database/model/product_model.dart';
import 'package:assignment/features/home/view/home_screen.dart';
import 'package:assignment/features/home/view/product_details_screen.dart';
import 'package:assignment/features/search/view/search_screen.dart';
import 'package:assignment/navigation/page_routes.dart';
import 'package:flutter/material.dart';

// Class for handling navigation routes
class Navigation {
  // Static method to generate routes based on route settings
  static Route<dynamic>? onGenerateRoutes(RouteSettings routeSettings) {
    // Retrieving arguments from route settings
    final arguments = routeSettings.arguments;

    // Switch statement to determine which route to navigate to based on route name
    switch (routeSettings.name) {
      case PageRoutes.homeScreen:
        // Returning MaterialPageRoute for the HomeScreen route
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const HomeScreen(),
        );
      case PageRoutes.productDetailsScreen:
        // Returning MaterialPageRoute for the ProductDetailsScreen route
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) =>
              ProductDetailsScreen(product: arguments as Product),
        );
      case PageRoutes.searchScreen:
        // Returning MaterialPageRoute for the SearchScreen route
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const SearchScreen(),
        );
      default:
        // Default case: Navigating to the HomeScreen if no matching route is found
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
