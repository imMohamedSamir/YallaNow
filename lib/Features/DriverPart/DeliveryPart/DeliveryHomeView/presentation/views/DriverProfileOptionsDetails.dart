import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/Functions/GotoOptionPage.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/ProfileOptionsCard.dart';

class DriverProfileOptionsDetails extends StatelessWidget {
  const DriverProfileOptionsDetails({super.key});
  static List<ProfileOptionsCardModel> options = [
    ProfileOptionsCardModel(
        title: 'Edit Profile', icon: Assets.imagesProfileIcon),
    ProfileOptionsCardModel(title: 'Language', icon: Assets.imagesLanguageIcon),
    ProfileOptionsCardModel(
        title: 'Help Center', icon: Assets.imagesHelpCenterIcon),
    ProfileOptionsCardModel(
        title: 'Privacy Policy', icon: Assets.imagesPrivacyIcon),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        onTap: () {},
        leading: const Icon(Icons.location_city_rounded),
        title: Text(
          'City',
          style: AppStyles.styleSemiBold16(context)
              .copyWith(color: const Color(0xff240301)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
      ...List.generate(
          options.length,
          (index) => ProfileOptionsCard(
                profileOptionsCardModel: options[index],
                onTap: () {
                  deliveryGoToOptionPage(index: index, context: context);
                },
              )),
      ListTile(
        onTap: () {
          logoutdialogMethode(context);
        },
        leading: SvgPicture.asset(Assets.imagesLogoutIcon),
        title: Text("Logout",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xffB20404))),
      )
    ]);
  }
}
