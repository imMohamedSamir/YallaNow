import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/PopularResturanModel.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_resturants_cubit/fetch_popular_resturants_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularResturansLV.dart';

class PopularResturansSec extends StatelessWidget {
  const PopularResturansSec({super.key});
  static List<popularResturant> resturants = [
    popularResturant(
        RestName: "KFC",
        Description: "Description",
        img: Assets.imagesMeal1,
        rating: 4,
        deliveryTime: 30),
    popularResturant(
        RestName: "McDonalds",
        Description: "Description",
        img: Assets.imagesMeal2,
        rating: 1,
        deliveryTime: 60),
    popularResturant(
        RestName: "KFC",
        Description: "Description",
        img: Assets.imagesMeal1,
        rating: 4,
        deliveryTime: 30),
    popularResturant(
        RestName: "McDonalds",
        Description: "Description",
        img: Assets.imagesMeal2,
        rating: 1,
        deliveryTime: 60)
  ];
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchPopularResturantsCubit>(context).getResturants();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Popular restaurant", style: AppStyles.styleMedium16(context)),
        PopularResturansLV(
          popularResturans: resturants,
        )
      ],
    );
  }
}
