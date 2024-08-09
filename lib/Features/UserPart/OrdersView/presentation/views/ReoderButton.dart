import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class ReoderButton extends StatelessWidget {
  const ReoderButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.getWidth(72, context),
      height: AppSizes.getHeight(23, context),
      child: MaterialButton(
          color: pKcolor,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: pKcolor)),
          onPressed: () {},
          child: Text(
            "Reorder",
            style:
                AppStyles.styleMedium10(context).copyWith(color: Colors.white),
          )),
    );
  }
}
