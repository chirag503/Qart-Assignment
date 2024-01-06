import 'package:assignment/database/model/product_model.dart';
import 'package:hive/hive.dart';

// Class representing a box for storing and retrieving product data using Hive
class ProductBox {
  // Function to retrieve product data from the Hive box
  static getProduct() {
    return Hive.box("productBox").get("products", defaultValue: null);
  }

  // Async function to store product data in the Hive box
  static Future<ProductModel> putProduct(ProductModel data) async {
    await Hive.box("productBox").put("products", data);
    return getProduct();
  }
}
