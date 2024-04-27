import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/user_details_cubit/user_details_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/EditProfileForm.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/ProfileImgSec.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<UserDetailsCubit, UserDetailsState>(
        builder: (context, state) {
          if (state is UserDetailsSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProfileImgSec(name: "${state.userProfileDetails.firstName}"),
                const SizedBox(height: 34),
                EditProfileForm(
                  userProfileDetails: state.userProfileDetails,
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
