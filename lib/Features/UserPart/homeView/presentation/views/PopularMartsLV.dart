import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_marts_cubit/fetch_popular_marts_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularMartCard.dart';

class PopularMartsLV extends StatelessWidget {
  const PopularMartsLV({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(210, context),
      child: BlocBuilder<FetchPopularMartsCubit, FetchPopularMartsState>(
        builder: (context, state) {
          if (state is FetchPopularMartsLoading) {
            return ListView.builder(
              padding: const EdgeInsets.only(right: 12),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: pKcolor.withOpacity(0.1),
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
          } else if (state is FetchPopularMartsSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.only(right: 12),
              scrollDirection: Axis.horizontal,
              itemCount: state.marts.length,
              itemBuilder: (context, index) {
                return PopularMartCard(
                  mart: state.marts[index],
                );
              },
            );
          } else if (state is FetchPopularMartsFailure) {
            return Center(
              child:
                  Text('Failed to fetch popular restaurants: ${state.errMsg}'),
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
