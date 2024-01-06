import 'package:assignment/database/model/product_model.dart';

// Abstract class representing the base state for the home screen or product fetching functionality
abstract class HomeState {}

// State representing the initial state of the home screen or product fetching
class HomeInitial extends HomeState {}

// State representing the loading state while fetching products
class ProductFetchLoadingState extends HomeState {}

// State representing the successful product fetch with product data
class ProductFetchSucessState extends HomeState {
  final ProductModel data;
  ProductFetchSucessState({required this.data});
}

// State representing the failure state during the product fetch process
class ProductFetchFailedState extends HomeState {}
