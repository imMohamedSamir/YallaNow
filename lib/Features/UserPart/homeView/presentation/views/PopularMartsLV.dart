import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/home_marts_model.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularMartCard.dart';

class PopularMartsLV extends StatelessWidget {
  const PopularMartsLV({super.key, required this.marts});
  final List<HomeMartsModel> marts;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSizes.getHeight(210, context),
        child: ListView.builder(
          padding: const EdgeInsets.only(right: 12),
          scrollDirection: Axis.horizontal,
          itemCount: marts.length,
          itemBuilder: (context, index) {
            return PopularMartCard(
              mart: marts[index],
            );
          },
        ));
  }
}
