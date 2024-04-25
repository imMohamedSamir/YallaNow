import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Repo/AuthRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/registeration_cubit/registeration_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ForgetPasswordBody.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterationCubit(getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        appBar: CustomAppBar(context, title: "Forget password ", onPressed: () {
          Navigator.pop(context);
        }),
        body: const ForgetPasswordBody(),
      ),
    );
  }
}
