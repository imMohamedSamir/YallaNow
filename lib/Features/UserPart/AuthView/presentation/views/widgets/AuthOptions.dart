import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/functions/getPadding.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/login_cubit/login_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/AuthCard.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({super.key});
  static const List<String> images = [
    Assets.imagesGoogle,
    Assets.imagesFacebook,

    // Assets.imagesApple,
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          images.length,
          (index) => Padding(
                padding: getPadding(
                    index: index, lastIndex: images.length, paddingValue: 20),
                child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      onTap(context, index: index);
                    },
                    child: AuthCard(image: images[index])),
              )),
    );
  }

  void onTap(BuildContext context, {required int index}) {
    if (index == 0) {
      BlocProvider.of<LoginCubit>(context).signinWithGoogle();
    } else if (index == 1) {
      BlocProvider.of<LoginCubit>(context).signinWithFacebook();
    }
  }
}
