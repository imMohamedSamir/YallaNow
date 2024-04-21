import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class RideOffersHeaderDetails extends StatelessWidget {
  const RideOffersHeaderDetails({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("30% off", style: AppStyles.styleBold24(context)),
        const SizedBox(height: 4),
        SizedBox(
          width: width * 0.45,
          child: Text(
            "Get discount for your first scooter ride.",
            style: AppStyles.styleMedium12(context)
                .copyWith(color: const Color(0xff240301)),
          ),
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}
