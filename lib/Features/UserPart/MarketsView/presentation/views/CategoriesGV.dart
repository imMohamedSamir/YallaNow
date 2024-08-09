import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/mart_details_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_details_cubit/mart_details_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketCategoriesCard.dart';

class CategoriesGV extends StatelessWidget {
  const CategoriesGV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MartDetailsCubit, MartDetailsState>(
      builder: (context, state) {
        if (state is MartDetailsSuccess) {
          List<MartDetailsModel> martsdetails = state.martsDetails;
          int itemCount = martsdetails.length < 3 ? martsdetails.length : 3;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16, crossAxisSpacing: 16, crossAxisCount: 3),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return MarketCategoriesCard(
                marketCategoriesModel: martsdetails[index],
              );
            },
          );
        } else if (state is MartDetailsLoading) {
          return SizedBox(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsets.only(right: 12),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: pKcolor.withOpacity(0.1),
                  child: Container(
                    height: AppSizes.getHeight(100, context),
                    width: AppSizes.getWidth(100, context),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                );
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
