import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/views/DriverDetails.dart';

class CaptinRatingCard extends StatelessWidget {
  const CaptinRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      title: Text("Ali", style: AppStyles.styleRegular16(context)),
      trailing: const DriverRatingIndicator(rate: 4),
    );
  }
}
