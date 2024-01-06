import 'package:assignment/features/home/controller/home_cubit.dart';
import 'package:assignment/features/home/controller/home_state.dart';
import 'package:assignment/features/home/widgets/product_card.dart';
import 'package:assignment/navigation/page_routes.dart';
import 'package:assignment/utils/constants/app_text_styles.dart';
import 'package:assignment/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';

// StatefulWidget for the Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Override initState method to fetch data when the screen is initialized
  @override
  void initState() {
    // Fetching data using the HomeCubit when the screen is initialized
    context.read<HomeCubit>().fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar with a title and search icon
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text(
          'My Design',
          style: AppTextStyles.f24W500White,
        ),
        actions: [
          // Navigate to the Search Screen
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, PageRoutes.searchScreen),
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
      // Body of the screen using BlocBuilder to manage the state of HomeCubit
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          // Loading state: Displaying a loading animation
          if (state is ProductFetchLoadingState) {
            return Center(child: Lottie.asset(ImagePath.loadingLottie));
          }

          // Failed state: Displaying an error message and a retry button
          if (state is ProductFetchFailedState) {
            return Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Lottie.asset(ImagePath.noData404Lottie, height: 300),
                Text(
                  "Something Went Wrong!",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.f26W600Black,
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 50,
                  width: 180,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black38),
                    ),
                    onPressed: () {
                      context.read<HomeCubit>().fetchData();
                    },
                    child: Text("Retry", style: AppTextStyles.f18W600White),
                  ),
                ),
              ]),
            );
          }

          // Success state: Displaying product data in a staggered grid view
          if (state is ProductFetchSucessState) {
            return RefreshIndicator(
              // Refreshing data when pulling down the screen
              onRefresh: () async {
                context.read<HomeCubit>().fetchData();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                        child: Text('${state.data.productCount ?? 0} Products',
                            style: AppTextStyles.f12W500Black87),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: StaggeredGrid.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 40,
                            crossAxisSpacing: 10,
                            children: state.data.products!
                                .map((element) => ProductCard(product: element))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          // Default state: Displaying an error message and a retry button
          return Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Lottie.asset(ImagePath.noData404Lottie, height: 300),
              Text(
                "Something Went Wrong!",
                textAlign: TextAlign.center,
                style: AppTextStyles.f26W600Black,
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 50,
                width: 180,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black38),
                  ),
                  onPressed: () {
                    context.read<HomeCubit>().fetchData();
                  },
                  child: Text("Retry", style: AppTextStyles.f18W600White),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
