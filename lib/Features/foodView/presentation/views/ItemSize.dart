import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class ItemSelectedDetails extends StatelessWidget {
  const ItemSelectedDetails(
      {super.key,
      this.value,
      this.groupValue,
      this.onChanged,
      required this.mealSize,
      required this.prices});

  final value, groupValue;
  final void Function(dynamic)? onChanged;
  final String mealSize, prices;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          mealSize,
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        const Spacer(),
        Text(prices,
            style: AppStyles.styleRegular10(context)
                .copyWith(color: const Color(0xff5A5A5A))),
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: const Color(0xffB20404),
        )
      ],
    );
  }
}
