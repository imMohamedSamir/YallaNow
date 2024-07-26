import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/Functions/launchURL.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/HelpCenterCard.dart';
import 'package:yallanow/generated/l10n.dart';

class HelpCenterBody extends StatelessWidget {
  const HelpCenterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Column(
        textDirection: TextDirection.ltr,
        children: [
          HelpCenterCard(
              onTap: () {
                launchURL("tel:+20 1143888697");
              },
              title: S.of(context).YallaNowPhone,
              child: const Icon(Icons.call, color: pKcolor)),
          const SizedBox(height: 24),
          HelpCenterCard(
              onTap: () {
                launchURL('mailto:info@yallanowofficial.com');
              },
              title: "info@yallanowofficial.com",
              child: const Icon(Icons.email, color: pKcolor)),
          const SizedBox(height: 24),
          HelpCenterCard(
              onTap: () {
                launchURL(
                    "https://www.facebook.com/profile.php?id=61559191288373&mibextid=JRoKGi");
              },
              title: "Facebook",
              child: const Icon(Icons.facebook, color: pKcolor)),
          const SizedBox(height: 24),
          HelpCenterCard(
              onTap: () {
                launchURL(
                    "https://www.instagram.com/yallanowofficial/?igsh=ZnhqMjNsbHVoc29y");
              },
              title: "Instagram",
              child: SvgPicture.asset(Assets.imagesInstagramIcon))
        ],
      ),
    );
  }
}
