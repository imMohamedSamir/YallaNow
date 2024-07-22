import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/Functions/GotoOptionPage.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/ProfileOptionsCard.dart';
import 'package:yallanow/generated/l10n.dart';

class ProfileOptionsDetails extends StatelessWidget {
  const ProfileOptionsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProfileOptionsCardModel> options = [
      ProfileOptionsCardModel(
          title: S.of(context).editprofile, icon: Assets.imagesProfileIcon),
      // ProfileOptionsCardModel(
      //     title: 'Your orders', icon: Assets.imagesOrdersIcon),
      ProfileOptionsCardModel(
          title: S.of(context).RidesHistory,
          icon: Assets.imagesScooterRideICon),
      // ProfileOptionsCardModel(
      //     title: 'Addresses', icon: Assets.imagesLocationMark),
      // ProfileOptionsCardModel(
      //     title: 'Favorite list', icon: Assets.imagesFavoriteIcon),
      ProfileOptionsCardModel(
          title: S.of(context).Language, icon: Assets.imagesLanguageIcon),
      ProfileOptionsCardModel(
          title: S.of(context).HelpCenter, icon: Assets.imagesHelpCenterIcon),
      ProfileOptionsCardModel(
          title: S.of(context).InviteFriends,
          icon: Assets.imagesInviteFriendsIcon),
      ProfileOptionsCardModel(
          title: S.of(context).PrivacyPolicy, icon: Assets.imagesPrivacyIcon),
    ];
    return Column(
      children: List.generate(
          options.length,
          (index) => ProfileOptionsCard(
                profileOptionsCardModel: options[index],
                onTap: () {
                  goToOptionPage(index: index, context: context);
                },
              )),
    );
  }
}
