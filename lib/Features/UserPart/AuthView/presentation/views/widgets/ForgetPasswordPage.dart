import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/password_reset_request_cubit/password_reset_request_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ForgetPasswordBody.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/generated/l10n.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordResetRequestCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        appBar: customAppBar(context, title: S.of(context).ForgetPassword,
            onPressed: () {
          Navigator.pop(context);
        }),
        body: const ForgetPasswordBody(),
      ),
    );
  }
}
