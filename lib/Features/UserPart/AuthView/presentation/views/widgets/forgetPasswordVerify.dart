import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/password_reset_request_cubit/password_reset_request_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ForgetPasswordVerifyBody.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/generated/l10n.dart';

class ForgetPasswordVerify extends StatelessWidget {
  const ForgetPasswordVerify({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VerifyOtpCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              PasswordResetRequestCubit(getIt.get<AuthRepoImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: customAppBar(context, title: S.of(context).ForgetPassword,
            onPressed: () {
          Navigator.pop(context);
        }),
        body: ForgetPasswordVerifyBody(email: email),
      ),
    );
  }
}
