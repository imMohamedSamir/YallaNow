import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

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
        value == groupValue
            ? Container(
                height: 20,
                width: 3,
                decoration: BoxDecoration(
                    color: pKcolor, borderRadius: BorderRadius.circular(32)))
            : const SizedBox(),
        const SizedBox(width: 16),
        Text(
          mealSize,
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        const Spacer(),
        Text("+ $prices EPG",
            style: AppStyles.styleRegular12(context)
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
