import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/Repo/ProfileRepoImpl.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/user_details_cubit/user_details_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/ProfileViewBody.dart';
import 'package:yallanow/generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserDetailsCubit(getIt.get<ProfileRepoImpl>())..fetchUserDetails(),
      child: Scaffold(
        appBar: secondHomeAppBar(context, title: S.of(context).profile),
        body: const ProfileViewBody(),
      ),
    );
  }
}
