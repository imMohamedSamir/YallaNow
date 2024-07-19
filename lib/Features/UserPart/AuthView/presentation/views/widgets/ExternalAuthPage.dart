import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/external_sign_up_cubit/external_sign_up_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ExternalAuthPageBody.dart';
import 'package:yallanow/generated/l10n.dart';

class ExternalAuthPage extends StatelessWidget {
  const ExternalAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExternalSignUpCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).SignUp),
        body: const ExternalAuthPageBody(),
      ),
    );
  }
}
