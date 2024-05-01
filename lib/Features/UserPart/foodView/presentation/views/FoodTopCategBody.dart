import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/top_categ_resturant_cubit/top_categ_resturant_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FilterListView.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodTopCategResturantLV.dart';

class FoodTopCategBody extends StatelessWidget {
  const FoodTopCategBody(
      {super.key, required this.categTitle, required this.categID});
  final String categTitle, categID;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TopCategResturantCubit>(context)
        .fetchResturants(categoryId: categID);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(categTitle, style: AppStyles.styleMedium18(context)),
          const SizedBox(height: 16),
          const FilterListView(),
          const SizedBox(height: 24),
          FoodTopCategResturantLV()
        ],
      ),
    );
  }
}
