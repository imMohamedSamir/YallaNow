import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/login_cubit/login_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginViewBody.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        appBar: customAppBar(context,
            title: S.of(context).SignIn, onPressed: () {}),
        body: const LoginViewBody(),
      ),
    );
  }
}
