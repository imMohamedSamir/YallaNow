import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class DeliveryTimeSec extends StatelessWidget {
  const DeliveryTimeSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.access_time_rounded, size: 27),
        Text(" 10:00 AM - 10:20 AM",
            style: AppStyles.styleSemiBold20(context)
                .copyWith(color: const Color(0xff240301)))
      ],
    );
  }
}
