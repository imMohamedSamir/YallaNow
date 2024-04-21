import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/Functions/launchURL.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/HelpCenterCard.dart';

class HelpCenterBody extends StatelessWidget {
  const HelpCenterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Column(
        children: [
          HelpCenterCard(
              onTap: () {
                launchURL("tel:+0111");
              },
              title: '0111',
              child: const Icon(Icons.call, color: Color(0xffB20404))),
          const SizedBox(height: 24),
          HelpCenterCard(
              onTap: () {
                launchURL('mailto:mousabsamir330@gmail.com');
              },
              title: "yallanow@gmail.com",
              child: const Icon(Icons.email, color: Color(0xffB20404))),
          const SizedBox(height: 24),
          HelpCenterCard(
              onTap: () {
                launchURL("https://www.facebook.com/mohamed.samirmohamed.731");
              },
              title: "Facebook",
              child: const Icon(Icons.facebook, color: Color(0xffB20404))),
          const SizedBox(height: 24),
          HelpCenterCard(
              onTap: () {
                launchURL("https://www.facebook.com/mohamed.samirmohamed.731");
              },
              title: "Instagram",
              child: SvgPicture.asset(Assets.imagesInstagramIcon))
        ],
      ),
    );
  }
}
