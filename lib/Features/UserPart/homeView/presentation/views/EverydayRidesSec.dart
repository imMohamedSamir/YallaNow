import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/EverydayridesLV.dart';

class EverydayRidesSec extends StatelessWidget {
  const EverydayRidesSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Everyday rides', style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        const EverydayridesLV()
      ],
    );
  }
}
