import 'package:flutter/material.dart';
import 'package:yallanow/Features/DriverPart/DeliveryRatingView/presentation/views/DeliveryRatingCard.dart';

class DeliveryRatingView extends StatelessWidget {
  const DeliveryRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: DeliveryRatingCard(),
          );
        },
      ),
    );
  }
}
