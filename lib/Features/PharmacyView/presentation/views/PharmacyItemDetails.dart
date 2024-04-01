import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/PharmacyView/presentation/views/PharmacyItemCard.dart';

class PharmacyItemDetails extends StatelessWidget {
  const PharmacyItemDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PharmacyItemCard(),
        const SizedBox(height: 14),
        Text(
          "Almarai Yogurt ",
          style: AppStyles.styleMedium14(context),
        ),
        Text(
          "78.95 EGP",
          style: AppStyles.styleMedium14(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        )
      ],
    );
  }
}
