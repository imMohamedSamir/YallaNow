import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/food_search_cubit/food_search_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchResultCard.dart';
import 'package:yallanow/generated/l10n.dart';

class FoodSearchResultSec extends StatelessWidget {
  const FoodSearchResultSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FoodSearchCubit, FoodSearchState>(
        builder: (context, state) {
          if (state is FoodSearchSuccess && state.results.isNotEmpty) {
            final results = state.results;
            return Expanded(
              child: Column(
                children: [
                  Text(S.of(context).Results,
                      style: AppStyles.styleMedium16(context)),
                  const Gap(16),
                  Expanded(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: results.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SearchResultCard(
                            resultModel: results[index], type: 2);
                      },
                    ),
                  )
                ],
              ),
            );
          } else if (state is FoodSearchLoading) {
            return const MartsLoading();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
