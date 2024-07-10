import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/Functions/launchURL.dart';
import 'package:yallanow/generated/l10n.dart';

class CallDetailsSec extends StatelessWidget {
  const CallDetailsSec({
    super.key,
    required this.phoneNumber,
  });
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchURL("tel:$phoneNumber");
      },
      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesIconCall),
          const SizedBox(width: 8),
          Flexible(
              child: Text(S.of(context).calltheDriver,
                  style: AppStyles.styleMedium16(context))),
        ],
      ),
    );
  }
}
