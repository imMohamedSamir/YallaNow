import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key});
  // final double width;
  // final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Box el combo",
                      style: AppStyles.styleMedium16(context)
                          .copyWith(color: const Color(0xff121212))),
                  const SizedBox(height: 4),
                  SizedBox(
                      width: AppSizes.getWidth(220, context),
                      child: Text(
                        "Lorem ipsum dolor sit amet ces tincidunt eleifend vitae",
                        style: AppStyles.styleRegular12(context)
                            .copyWith(color: const Color(0xff898989)),
                      )),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "EGP 300.00",
                        style: AppStyles.styleRegular10(context)
                            .copyWith(color: const Color(0xffB20404)),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "EGP 300.00",
                        style: AppStyles.styleRegular10(context).copyWith(
                            color: const Color(0xff5A5A5A),
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  )
                ],
              ),
              Expanded(child: Image.asset(Assets.imagesDiscountImg))
            ],
          ),
          const SizedBox(height: 18),
          const Divider()
        ],
      ),
    );
  }
}
