import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/login_cubit/login_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/registeration_cubit/registeration_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignupTerms.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignupViewBody.dart';
import 'package:yallanow/generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterationCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: mainAppBar(context, title: S.of(context).CreateAccount),
        body: const SignupViewBody(),
        bottomNavigationBar: const SignupTerms(),
      ),
    );
  }
}
