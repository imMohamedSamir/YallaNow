import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/food_search_cubit/food_search_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodSearchResultLV.dart';

class FoodSearchResultSec extends StatelessWidget {
  const FoodSearchResultSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<FoodSearchCubit, FoodSearchState>(
            builder: (context, state) {
              if (state is FoodSearchSuccess && state.results.isNotEmpty) {
                return Text("Results", style: AppStyles.styleMedium16(context));
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(height: 16),
          const FoodSearchResultLV()
        ],
      ),
    );
  }
}
