import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/user_details_cubit/user_details_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/ProfileImgSec.dart';

class ProfileDetailsSec extends StatelessWidget {
  const ProfileDetailsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      builder: (context, state) {
        if (state is UserDetailsSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileImgSec(name: state.userProfileDetails.firstName!),
              const SizedBox(height: 12),
              Center(
                child: Text(
                    "${state.userProfileDetails.firstName!} ${state.userProfileDetails.lastName!}",
                    style: AppStyles.styleSemiBold20(context).copyWith(
                        fontSize: 24, color: const Color(0xff212121))),
              ),
              const SizedBox(height: 2),
              Center(
                child: Text(state.userProfileDetails.email!,
                    style: AppStyles.styleMedium14(context)
                        .copyWith(color: const Color(0xff212121))),
              ),

              // Text(data)
            ],
          );
        } else if (state is UserDetailsLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              children: [
                Container(
                  width: AppSizes.getWidth(120, context),
                  height: AppSizes.getHeight(120, context),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
                const SizedBox(height: 12),
                Container(
                  width: AppSizes.getWidth(130, context),
                  height: AppSizes.getHeight(12, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                ),
                const SizedBox(height: 6),
                Container(
                  width: AppSizes.getWidth(100, context),
                  height: AppSizes.getHeight(8, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                ),
              ],
            ),
          );
        } else if (state is UserDetailsFailure) {
          return Text(state.errMsg);
        }

        return const SizedBox();
      },
    );
  }
}
