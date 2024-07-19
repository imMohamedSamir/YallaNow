import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ResetPasswordBody.dart';

import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/generated/l10n.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key, this.email, this.otp});
  final String? email, otp;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
          appBar: customAppBar(context, title: S.of(context).ResetPassword,
              onPressed: () {
            Navigator.pop(context);
          }),
          body: ResetPasswordBody(email: email, otp: otp)),
    );
  }
}
