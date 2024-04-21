import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/AuthCard.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({super.key});
  static const List<String> images = [
    Assets.imagesFacebook,
    Assets.imagesGoogle,
    // Assets.imagesApple,
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          images.length,
          (index) => Padding(
                padding: EdgeInsets.only(right: index == 2 ? 0 : 20),
                child: AuthCard(image: images[index]),
              )),
    );
  }
}
