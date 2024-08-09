import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/generated/l10n.dart';

class ItemSelectedDetails extends StatelessWidget {
  const ItemSelectedDetails({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.mealSize,
    required this.prices,
  });

  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic)? onChanged;
  final String mealSize;
  final String prices;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding: EdgeInsets.zero,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: pKcolor,
      title: Row(
        children: [
          Text(
            mealSize,
            style: AppStyles.styleRegular16(context)
                .copyWith(color: const Color(0xff5A5A5A)),
          ),
          const Spacer(),
          Text("+ $prices ${S.of(context).EGP}",
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: const Color(0xff5A5A5A)))
        ],
      ),
      secondary: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 20,
        width: value == groupValue ? 3 : 0,
        decoration: BoxDecoration(
          color: pKcolor,
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
