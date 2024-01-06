import 'package:assignment/database/hive/product_box.dart';
import 'package:assignment/database/model/product_model.dart';
import 'package:assignment/features/search/controller/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Cubit for managing the state related to product search functionality
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  // TextEditingController for handling the search input
  final TextEditingController searchController = TextEditingController();

  // Asynchronous method to search products based on the given query
  Future<void> searchProducts(String query) async {
    emit(SearchProductLoadingState());
    try {
      // List to store searched products
      final List<Product> searchedProductList = [];

      // Converting query to lower case for case-insensitive search
      query = query.toLowerCase();

      // Retrieving product data from Hive storage
      ProductModel data = await ProductBox.getProduct();

      // Iterating through each product to check for a match with the query
      for (Product product in (data.products ?? [])) {
        if ((product.qrCode != null &&
                (product.qrCode ?? "").toLowerCase().contains(query)) ||
            (product.option != null &&
                (product.option ?? "").toLowerCase().contains(query))) {
          searchedProductList.add(product);
        }
      }

      emit(SearchProductSucessState(searchData: searchedProductList));
    } catch (e) {
      emit(SearchProductFailedState());
    }
  }
}
