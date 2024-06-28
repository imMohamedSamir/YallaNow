import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class CallDetailsSec extends StatelessWidget {
  const CallDetailsSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesDriverShare),
        const SizedBox(width: 10),
        Text("Share ride details", style: AppStyles.styleMedium16(context)),
        const Spacer(),
        SvgPicture.asset(Assets.imagesIconCall),
        const SizedBox(width: 10),
        Text("call the Driver", style: AppStyles.styleMedium16(context)),
      ],
    );
  }
}
