import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/Repo/DriverRegisterationRepoImpl.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DriverSignUpViewBody.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignupTerms.dart';
import 'package:yallanow/generated/l10n.dart';

class DriverSignUpView extends StatelessWidget {
  const DriverSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DriverRegisterationCubit(getIt.get<DriverRegisterationRepoImpl>()),
      child: Scaffold(
        appBar: mainAppBar(context, title: S.of(context).CreateAccount),
        body: const DriverSignUpViewBody(),
        bottomNavigationBar: const SignupTerms(),
      ),
    );
  }
}
