import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/homeView/presentation/views/EveryDayRidesCard.dart';

class EveryDayRidesDetails extends StatelessWidget {
  const EveryDayRidesDetails(
      {super.key, required this.height, required this.width});
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EveryDayRidesCard(height: height, width: width),
        const SizedBox(height: 4),
        Row(
          children: [
            Text("Almarai Yogurt ",
                style: AppStyles.styleMedium14(context)
                    .copyWith(color: const Color(0xff240301))),
            const SizedBox(width: 3),
            const Icon(Icons.arrow_forward_ios_rounded, size: 18)
          ],
        ),
        const SizedBox(height: 4),
        Text(
          "30% discount",
          style: AppStyles.styleMedium12(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        )
      ],
    );
  }
}
