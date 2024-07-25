import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/Repo/ProfileRepoImpl.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/delete_account_cubit/delete_account_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/DeleteAccountPageBody.dart';
import 'package:yallanow/generated/l10n.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAccountCubit(getIt.get<ProfileRepoImpl>()),
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).DeleteAcc),
        body: const DeleteAccountPageBody(),
      ),
    );
  }
}
