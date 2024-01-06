import 'package:assignment/utils/helper_methods.dart';
import 'package:http/http.dart' as http;

// Repository class responsible for handling API requests related to product data
class HomeRepository {
  // Base URL for the API
  final String baseUrl = "https://ios.qartsolutions.com/api";

  // Headers for the API request
  var headers = {
    'Cookie':
        'ARRAffinity=2d3b3fe4782bdd6b0c5aa09aa9568ced0cf5822d8bd38e9ce084b98da8d3fc6d; ARRAffinitySameSite=2d3b3fe4782bdd6b0c5aa09aa9568ced0cf5822d8bd38e9ce084b98da8d3fc6d; ASP.NET_SessionId=y5scdkrmunqa1viz3krdrhmx'
  };

  // Async method to fetch product data from the API
  Future<String> getProduct() async {
    var response = await http.get(
        Uri.parse(
            'https://ios.qartsolutions.com/api/product/GetProductsWithSizes?retailerCode=40984'),
        headers: headers);

    return HelperMethods().errorHandler(response);
  }
}
