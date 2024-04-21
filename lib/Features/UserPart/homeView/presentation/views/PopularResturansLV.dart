import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/PopularResturanModel.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_resturants_cubit/fetch_popular_resturants_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularResturantCard.dart';

class PopularResturansLV extends StatelessWidget {
  const PopularResturansLV({super.key, required this.popularResturans});
  final List<popularResturant> popularResturans;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(210, context),
      child:
          BlocBuilder<FetchPopularResturantsCubit, FetchPopularResturantsState>(
        builder: (context, state) {
          if (state is FetchPopularResturantsLoading) {
            return ListView.builder(
              padding: const EdgeInsets.only(right: 12),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: AppSizes.getHeight(100, context),
                    width: AppSizes.getWidth(145, context),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                );
              },
            );
          } else if (state is FetchPopularResturantsSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.only(right: 12),
              scrollDirection: Axis.horizontal,
              itemCount: state.resturants.length,
              itemBuilder: (context, index) {
                return PopularResturantCard(
                  popularResturants: state.resturants[index],
                );
              },
            );
          } else if (state is FetchPopularResturantsFailure) {
            return Center(
              child:
                  Text('Failed to fetch popular restaurants: ${state.errMSG}'),
            );
          } else {
            // Handle other states if needed
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
