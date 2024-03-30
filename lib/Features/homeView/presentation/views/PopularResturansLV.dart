import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/homeView/data/Models/PopularResturanModel.dart';
import 'package:yallanow/Features/homeView/presentation/views/PopularResturantCard.dart';

class PopularResturansLV extends StatelessWidget {
  const PopularResturansLV({super.key, required this.popularResturans});
  final List<popularResturantModel> popularResturans;
  @override
  Widget build(BuildContext context) {
    // final double hieght = MediaQuery.of(context).size.height * 0.259;
    return SizedBox(
      height: AppSizes.getHeight(210, context),
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 12),
        scrollDirection: Axis.horizontal,
        itemCount: popularResturans.length,
        itemBuilder: (context, index) {
          return PopularResturantCard(resturantModel: popularResturans[index]);
        },
      ),
    );
  }
}
