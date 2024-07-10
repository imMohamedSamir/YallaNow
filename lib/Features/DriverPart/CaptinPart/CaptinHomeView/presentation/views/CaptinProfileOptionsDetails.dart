import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/Functions/GotoOptionPage.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/ProfileOptionsCard.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/UserRidRequestCubit.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinProfileOptionsDetails extends StatelessWidget {
  const CaptinProfileOptionsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProfileOptionsCardModel> options = [
      ProfileOptionsCardModel(
          title: S.of(context).editprofile, icon: Assets.imagesProfileIcon),
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
                  deliveryGoToOptionPage(index: index, context: context);
                },
              )),
      ListTile(
        onTap: () {
          logoutdialogMethode(context);
          // BlocProvider.of<ScooterRequestCubit>(context).leaveGroup("Drivers");
        },
        leading: SvgPicture.asset(Assets.imagesLogoutIcon),
        title: Text(S.of(context).logout,
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xffB20404))),
      )
    ]);
  }
}
