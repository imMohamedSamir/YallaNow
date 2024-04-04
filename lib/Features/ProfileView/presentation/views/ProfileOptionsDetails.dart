import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/ProfileView/presentation/manager/Functions/GotoOptionPage.dart';
import 'package:yallanow/Features/ProfileView/presentation/views/ProfileOptionsCard.dart';

class ProfileOptionsDetails extends StatelessWidget {
  const ProfileOptionsDetails({super.key});
  static List<ProfileOptionsCardModel> options = [
    ProfileOptionsCardModel(
        title: 'Edit Profile', icon: Assets.imagesProfileIcon),
    ProfileOptionsCardModel(
        title: 'Your orders', icon: Assets.imagesOrdersIcon),
    ProfileOptionsCardModel(
        title: 'Your rides', icon: Assets.imagesScooterRideICon),
    ProfileOptionsCardModel(
        title: 'Addresses', icon: Assets.imagesLocationMark),
    ProfileOptionsCardModel(
        title: 'Favorite list', icon: Assets.imagesFavoriteIcon),
    ProfileOptionsCardModel(title: 'Language', icon: Assets.imagesLanguageIcon),
    ProfileOptionsCardModel(
        title: 'Help Center', icon: Assets.imagesHelpCenterIcon),
    ProfileOptionsCardModel(
        title: 'Invite Friends', icon: Assets.imagesInviteFriendsIcon),
    ProfileOptionsCardModel(
        title: 'Privacy Policy', icon: Assets.imagesPrivacyIcon),
  ];
  @override
  Widget build(BuildContext context) {
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
