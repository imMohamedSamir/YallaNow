import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/Repo/ProfileRepoImpl.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/edit_user_details_cubit/edit_user_details_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/user_details_cubit/user_details_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/EditProfileBody.dart';
import 'package:yallanow/generated/l10n.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserDetailsCubit(getIt.get<ProfileRepoImpl>())
            ..fetchUserDetails(),
        ),
        BlocProvider(
          create: (context) =>
              EditUserDetailsCubit(getIt.get<ProfileRepoImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).editprofile),
        body: const EditProfileBody(),
      ),
    );
  }
}
