import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

// Utility class containing helper methods
class HelperMethods {
  // Asynchronous method to check internet connection
  Future<bool> checkInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    // Returning the result of internet connection check
    return result;
  }

  // Method to format and display the actual price
  String actualPrice(num price) {
    return "\u{20B9}${price.toInt()}";
  }

  // Method to calculate and display the discounted price
  String discountPrice(num price) {
    final val = (price - (price * 0.5)).toInt();
    return "\u{20B9}$val";
  }

  // Method to handle errors and provide appropriate messages based on the HTTP status code
  String errorHandler(http.Response response) {
    switch (response.statusCode) {
      case 200:
        // Logging success message for a successful API call with status code 200
        log("👍👍👍👍 API CALLED");
        return response.body;
      case 202:
        // Logging success message for successful API calls with status codes 201 and 202
        log("👍👍👍👍 API CALLED");
        return response.body;
      case 500:
        // Returning an error message for server error with status code 500
        return "Server Error pls retry later";
      case 403:
        // Returning an error message for forbidden access with status code 403
        return 'Error occurred pls check internet and retry.';
      default:
        // Returning a generic error message for other status codes
        return 'Error occurred retry ${response.statusCode}';
    }
  }

  /// A concise utility function to extract a non-null and non-empty string, or return "--" if the input is null or empty.
  static String stringExtract(String? data) {
    // Use the null-aware operators to check if data is not null and not empty
    return data?.isNotEmpty ?? false ? data! : "--";
  }
}
