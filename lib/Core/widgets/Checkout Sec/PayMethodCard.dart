import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class PayMethodCard extends StatelessWidget {
  const PayMethodCard({
    Key? key,
    required this.method,
    this.value,
    this.groupValue,
    this.onChanged,
    required this.img,
  }) : super(key: key);

  final value, groupValue;
  final void Function(dynamic)? onChanged;
  final String method;
  final Widget img;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: AppSizes.getWidth(55, context),
        child: RadioListTile(
          activeColor: const Color(0xffB20404),
          shape: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff5A5A5A)),
            borderRadius: BorderRadius.circular(8),
          ),
          title: Row(
            children: [
              img,
              const SizedBox(width: 12),
              Text(
                method,
                style: AppStyles.styleMedium16(context)
                    .copyWith(color: const Color(0xff5A5A5A)),
              ),
            ],
          ),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ));
  }
}
