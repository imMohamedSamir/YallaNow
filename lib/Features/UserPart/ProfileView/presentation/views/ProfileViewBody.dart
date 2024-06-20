import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/ProfileDetailsSec.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/ProfileOptionsDetails.dart';
import 'package:yallanow/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileDetailsSec(),
          const SizedBox(height: 24),
          const ProfileOptionsDetails(),
          ListTile(
            onTap: () {
              logoutdialogMethode(context);
            },
            leading: SvgPicture.asset(Assets.imagesLogoutIcon),
            title: Text(S.of(context).logout,
                style: AppStyles.styleSemiBold16(context)
                    .copyWith(color: const Color(0xffB20404))),
          )
        ],
      ),
    );
  }
}
