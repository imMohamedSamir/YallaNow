import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class ProfileOptionsCard extends StatelessWidget {
  const ProfileOptionsCard({
    super.key,
    required this.profileOptionsCardModel,
    this.onTap,
  });
  final ProfileOptionsCardModel profileOptionsCardModel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(
        profileOptionsCardModel.icon,
        colorFilter: const ColorFilter.mode(Color(0xff240301), BlendMode.srcIn),
      ),
      title: Text(
        profileOptionsCardModel.title,
        style: AppStyles.styleSemiBold16(context)
            .copyWith(color: const Color(0xff240301)),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}

class ProfileOptionsCardModel {
  final String title, icon;

  ProfileOptionsCardModel({required this.title, required this.icon});
}
