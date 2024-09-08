import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/mart_details_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_details_cubit/mart_details_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketCategoriesCard.dart';
import 'package:yallanow/generated/l10n.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: categoryAppBar(context, title: S.of(context).marts),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: AllCategoriesGV(),
      ),
    );
  }
}

class AllCategoriesGV extends StatelessWidget {
  const AllCategoriesGV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MartDetailsCubit, MartDetailsState>(
      builder: (context, state) {
        if (state is MartDetailsSuccess) {
          List<MartDetailsModel> martsdetails = state.martsDetails;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16, crossAxisSpacing: 16, crossAxisCount: 3),
            itemCount: martsdetails.length,
            itemBuilder: (context, index) {
              return MarketCategoriesCard(
                  marketCategoriesModel: martsdetails[index]);
            },
          );
        } else if (state is MartDetailsLoading) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16, crossAxisSpacing: 16, crossAxisCount: 3),
            itemCount: 10,
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
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
