import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class FoodBottomBarDetails extends StatelessWidget {
  const FoodBottomBarDetails({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width * 0.0585,
          height: height * 0.065 - 27,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: Text(
              "1",
              style: AppStyles.styleMedium16(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text("View basket",
            style:
                AppStyles.styleMedium16(context).copyWith(color: Colors.white)),
        const Spacer(),
        Text("EGP 100.00",
            style:
                AppStyles.styleMedium16(context).copyWith(color: Colors.white)),
      ],
    );
  }
}
