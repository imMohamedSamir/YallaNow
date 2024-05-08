import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/MarketCategoriesModel.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/mart_details_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_details_cubit/mart_details_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketCategoriesCard.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: categoryAppBar(context, title: "Marts"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
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
                marketCategoriesModel: martsdetails[index],
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
