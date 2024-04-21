import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodItemQyt.dart';

class PharmacyItemDescription extends StatelessWidget {
  const PharmacyItemDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24, top: 16, left: 16, right: 16),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Panadol Extra", style: AppStyles.styleSemiBold20(context)),
              const SizedBox(height: 4),
              Text("product description here",
                  style: AppStyles.styleRegular16(context)
                      .copyWith(color: const Color(0xff5A5A5A))),
              const SizedBox(height: 6),
              Text(
                "EGP 50.00",
                style: AppStyles.styleRegular14(context)
                    .copyWith(color: const Color(0xff5A5A5A)),
              )
            ],
          ),
          const Spacer(),
          const FoodItemQyt()
        ],
      ),
    );
  }
}
