import 'package:flutter/material.dart';
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
        Text(
          dsc,
          style: AppStyles.styleRegular12(context),
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
      margin: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
      height: 16,
      width: 2,
      decoration: const BoxDecoration(color: scColor),
    );
  }
}
