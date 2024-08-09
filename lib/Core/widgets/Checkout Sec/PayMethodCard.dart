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
    this.enabled = true, // Add an enabled parameter
  }) : super(key: key);

  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic)? onChanged;
  final String method;
  final Widget img;
  final bool enabled; // Add an enabled field

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
          onChanged: enabled
              ? onChanged
              : null, // Disable the radio button if enabled is false
        ));
  }
}
