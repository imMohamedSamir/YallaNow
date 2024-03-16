import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/homeView/data/Models/CardDetailModel.dart';
import 'package:yallanow/Features/homeView/presentation/views/RideCategCard.dart';
import 'package:yallanow/Features/homeView/presentation/views/categCadDetaisl.dart';

class CategorySec extends StatelessWidget {
  const CategorySec({super.key});
  static List<CardDetails> details = [
    CardDetails(title: "Food", avgTime: "29 min", img: Assets.imagesFood),
    CardDetails(
        title: "Mart", avgTime: "30 min", img: Assets.imagesMarketbasket),
    CardDetails(title: "Pharmcy", avgTime: "29 min", img: Assets.imagesFood),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              3,
              (index) => Padding(
                    padding: EdgeInsets.only(right: index == 2 ? 0 : 16),
                    child: categCardDetails(
                      cardDetails: details[index],
                    ),
                  )),
        ),
        const SizedBox(height: 16),
        const RideCateg()
      ],
    );
  }
}
