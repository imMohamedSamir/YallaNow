import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/Manager/language_cubit/language_cubit.dart';
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onTap: onTap,
      leading: SvgPicture.asset(
        profileOptionsCardModel.icon,
        colorFilter: const ColorFilter.mode(Color(0xff240301), BlendMode.srcIn),
      ),
      title: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, state) {
          String lan = state.languageCode == 'en' ? 'English' : 'العربية';
          if (profileOptionsCardModel.title == "Language" ||
              profileOptionsCardModel.title == "اللغة") {
            return Row(
              children: [
                Text(
                  profileOptionsCardModel.title,
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: const Color(0xff240301)),
                ),
                const Spacer(),
                Text(
                  lan,
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: const Color(0xff240301)),
                ),
              ],
            );
          } else {
            return Text(
              profileOptionsCardModel.title,
              style: AppStyles.styleSemiBold16(context)
                  .copyWith(color: const Color(0xff240301)),
            );
          }
        },
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}

class ProfileOptionsCardModel {
  final String title, icon;

  ProfileOptionsCardModel({required this.title, required this.icon});
}
