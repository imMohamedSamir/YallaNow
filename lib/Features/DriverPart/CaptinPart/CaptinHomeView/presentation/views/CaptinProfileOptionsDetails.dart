import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/Functions/GotoOptionPage.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/ProfileOptionsCard.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinProfileOptionsDetails extends StatelessWidget {
  const CaptinProfileOptionsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProfileOptionsCardModel> options = [
      ProfileOptionsCardModel(
          title: S.of(context).CaptinProfile, icon: Assets.imagesProfileIcon),
      ProfileOptionsCardModel(
          title: S.of(context).driverPapers, icon: Assets.imagesOrdersIcon),
      ProfileOptionsCardModel(
          title: S.of(context).VehicleDetails,
          icon: Assets.imagesScooterRideICon),
      ProfileOptionsCardModel(
          title: S.of(context).Language, icon: Assets.imagesLanguageIcon),
      ProfileOptionsCardModel(
          title: S.of(context).HelpCenter, icon: Assets.imagesHelpCenterIcon),
      ProfileOptionsCardModel(
          title: S.of(context).PrivacyPolicy, icon: Assets.imagesPrivacyIcon),
    ];
    return Column(children: [
      // ListTile(
      //   onTap: () {},
      //   leading: const Icon(Icons.location_city_rounded),
      //   title: Text(
      //     'City',
      //     style: AppStyles.styleSemiBold16(context)
      //         .copyWith(color: const Color(0xff240301)),
      //   ),
      //   trailing: const Icon(Icons.arrow_forward_ios_rounded),
      // ),
      ...List.generate(
          options.length,
          (index) => ProfileOptionsCard(
                profileOptionsCardModel: options[index],
                onTap: () {
                  captinGoToOptionPage(index: index, context: context);
                },
              )),
      ListTile(
        onTap: () {
          logoutdialogMethode(context);
          // BlocProvider.of<CaptinRideRequestCubit>(context).disconnect();
        },
        leading: SvgPicture.asset(Assets.imagesLogoutIcon),
        title: Text(S.of(context).logout,
            style: AppStyles.styleSemiBold16(context).copyWith(color: pKcolor)),
      )
    ]);
  }
}
