import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
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
                EditProfileForm(userProfileDetails: state.userProfileDetails),
              ],
            );
          } else if (state is UserDetailsLoading) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: AppSizes.getWidth(120, context),
                      height: AppSizes.getHeight(120, context),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    const SizedBox(height: 50),
                    ...List.generate(
                      5,
                      (index) => Container(
                        width: AppSizes.getWidth(130, context),
                        height: AppSizes.getHeight(50, context),
                        margin: const EdgeInsets.only(bottom: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
