import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/food_search_cubit/food_search_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchResultCard.dart';

class FoodSearchResultLV extends StatelessWidget {
  const FoodSearchResultLV({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FoodSearchCubit, FoodSearchState>(
        builder: (context, state) {
          if (state is FoodSearchSuccess) {
            final results = state.results;
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: results.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchResultCard(resultModel: results[index], type: 2);
              },
            );
          } else if (state is FoodSearchLoading) {
            return const MartsLoading();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
