import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class RiderSrcDstCard extends StatelessWidget {
  const RiderSrcDstCard({
    super.key,
    required this.dsc,
    this.isSrc = true,
  });
  final String dsc;
  final bool isSrc;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(isSrc ? Icons.mode_standby_rounded : Icons.location_on_sharp,
            color: pKcolor, size: 18),
        const SizedBox(width: 14),
        SizedBox(
          width: AppSizes.getWidth(290, context),
          child: Text(
            dsc,
            style: AppStyles.styleRegular14(context).copyWith(color: scColor),
          ),
        )
      ],
    );
  }
}

class RiderSrcDstDivider extends StatelessWidget {
  const RiderSrcDstDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: AppLang.isArabic() ? 0 : 8,
          top: 2,
          bottom: 2,
          right: AppLang.isArabic() ? 8 : 0),
      height: 16,
      width: 2,
      decoration: const BoxDecoration(color: scColor),
    );
  }
}
