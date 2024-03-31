import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/MarketsView/data/models/BradnsModel.dart';

class MartsBrandsCard extends StatelessWidget {
  const MartsBrandsCard({super.key, required this.bradnsModel});
  final BradnsModel bradnsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: AppSizes.getWidth(148, context),
          height: AppSizes.getHeight(152, context),
          decoration: BoxDecoration(
              color: const Color(0xffFFD8CF),
              borderRadius: BorderRadius.circular(16)),
          child: Image.asset(
            bradnsModel.img,
            alignment: Alignment.bottomCenter,
            height: AppSizes.getHeight(127, context),
            width: AppSizes.getWidth(140, context),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          bradnsModel.name,
          style: AppStyles.styleMedium14(context).copyWith(color: Colors.black),
        )
      ],
    );
  }
}
