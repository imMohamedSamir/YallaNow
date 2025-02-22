import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/EveryDayRidesDetails.dart';

class EverydayridesLV extends StatelessWidget {
  const EverydayridesLV({super.key});

  @override
  Widget build(BuildContext context) {
    final double hieght = MediaQuery.of(context).size.height * 0.22;
    final double width = MediaQuery.of(context).size.width * 0.6045;

    return SizedBox(
      height: AppSizes.getHeight(200, context),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return EveryDayRidesDetails(
            height: hieght,
            width: width,
          );
        },
      ),
    );
  }
}
