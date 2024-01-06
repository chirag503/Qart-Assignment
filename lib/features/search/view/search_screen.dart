import 'package:assignment/features/search/controller/search_cubit.dart';
import 'package:assignment/features/search/controller/search_state.dart';
import 'package:assignment/features/search/widgets/search_product_card.dart';
import 'package:assignment/utils/constants/app_text_styles.dart';
import 'package:assignment/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

// StatelessWidget for displaying the search screen with a search bar and search results
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with a search bar
      appBar: AppBar(
        backgroundColor: Colors.black45,
        leading: const BackButton(color: Colors.white),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              onChanged: (value) {
                // Triggering the search operation when the text in the search bar changes
                context.read<SearchCubit>().searchProducts(value);
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      // Clearing the search bar and triggering the search operation
                      context.read<SearchCubit>().searchController.clear();
                      context.read<SearchCubit>().searchProducts("");
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
              controller: context.read<SearchCubit>().searchController,
            ),
          ),
        ),
      ),
      // Body of the screen with dynamic content based on the search state
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          // Displaying a loading animation while searching
          if (state is SearchProductLoadingState) {
            Center(child: Lottie.asset(ImagePath.searchLoadingLottie));
          }
          // Displaying a message when the search fails
          if (state is SearchProductFailedState) {
            Center(child: Lottie.asset(ImagePath.noDataLottie));
          }
          // Displaying search results when the search is successful
          if (state is SearchProductSucessState) {
            return state.searchData.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(ImagePath.noDataLottie),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Total Products Found: ${state.searchData.length}',
                                style: AppTextStyles.f12W500Black87),
                            const SizedBox(
                              height: 10,
                            ),
                            // Displaying the search results using a ListView
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.searchData.length,
                                itemBuilder: (context, index) =>
                                    SearchProductCard(
                                        product: state.searchData[index]),
                              ),
                            ),
                          ]),
                    ),
                  );
          }
          // Displaying a message prompting the user to start a search
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(ImagePath.searchingLottie),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Search Your Product",
                textAlign: TextAlign.center,
                style: AppTextStyles.f28W700Black,
              ),
            ],
          );
        },
      ),
    );
  }
}
