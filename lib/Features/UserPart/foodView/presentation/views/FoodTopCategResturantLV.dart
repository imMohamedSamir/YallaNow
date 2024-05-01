import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/top_categ_resturant_cubit/top_categ_resturant_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodTopCategResturantCard.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/TopCategLoading.dart';

class FoodTopCategResturantLV extends StatelessWidget {
  const FoodTopCategResturantLV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopCategResturantCubit, TopCategResturantState>(
      builder: (context, state) {
        if (state is TopCategResturantSuccess) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("All Restaurants",
                    style: AppStyles.styleMedium16(context)),
                const SizedBox(height: 16),
                ListView.builder(
                  itemCount: state.resturants.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final isLastIndex = index == state.resturants.length - 1;
                    return Padding(
                      padding: EdgeInsets.only(bottom: isLastIndex ? 0 : 16),
                      child: FoodTopCategResturantCard(
                        resturant: state.resturants[index],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        } else if (state is TopCategResturantLoading) {
          return const TopCategLoading();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
