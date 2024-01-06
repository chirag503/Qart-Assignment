// Importing necessary packages and files
import 'package:assignment/database/hive/product_box.dart';
import 'package:assignment/database/model/product_model.dart';
import 'package:assignment/features/home/controller/home_state.dart';
import 'package:assignment/features/home/repository/home_repository.dart';
import 'package:assignment/utils/helper_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Cubit class responsible for managing the state of the Home screen
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // Method to fetch data based on internet connectivity
  void fetchData() {
    HelperMethods().checkInternet().then((value) async {
      // If there is internet connectivity, fetch data from the API, else fetch from cache
      if (value) {
        await fetchProductFromApi();
      } else {
        await fetchProductFromCache();
      }
    });
  }

  // Async method to fetch product data from the API
  Future<void> fetchProductFromApi() async {
    emit(ProductFetchLoadingState());
    try {
      // Fetching product data from the API through the repository
      ProductModel data = await HomeRepository().getProduct().then((value) async {
        final response = productModelFromJson(value);
        return await ProductBox.putProduct(response);
      });
      emit(ProductFetchSucessState(data: data));
    } catch (e) {
      emit(ProductFetchFailedState());
    }
  }

  // Async method to fetch product data from the local cache (Hive box)
  Future<void> fetchProductFromCache() async {
    emit(ProductFetchLoadingState());
    try {
      // Fetching product data from the local cache (Hive box)
      ProductModel data = await ProductBox.getProduct();
      emit(ProductFetchSucessState(data: data));
    } catch (e) {
      emit(ProductFetchFailedState());
    }
  }
}
