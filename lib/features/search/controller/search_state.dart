import 'package:assignment/database/model/product_model.dart';

// Abstract class representing the base state for search functionality
abstract class SearchState {}

// State representing the initial state of the search functionality
class SearchInitial extends SearchState {}

// State representing the loading state while searching for products
class SearchProductLoadingState extends SearchState {}

// State representing the successful search with a list of products
class SearchProductSucessState extends SearchState {
  final List<Product> searchData;
  SearchProductSucessState({required this.searchData});
}

// State representing the failure state during the search process
class SearchProductFailedState extends SearchState {}
