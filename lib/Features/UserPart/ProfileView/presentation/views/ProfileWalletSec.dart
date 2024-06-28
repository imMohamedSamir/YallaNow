import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/user_details_cubit/user_details_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class ProfileWalletSec extends StatelessWidget {
  const ProfileWalletSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesWallet),
          const Gap(20),
          Text(S.of(context).Wallet, style: AppStyles.styleSemiBold16(context)),
          const Spacer(),
          BlocBuilder<UserDetailsCubit, UserDetailsState>(
            builder: (context, state) {
              if (state is UserDetailsSuccess) {
                String balance = state.userProfileDetails.wallet.toString();
                return Text("$balance EGP",
                    style: AppStyles.styleMedium16(context)
                        .copyWith(color: pKcolor));
              } else if (state is UserDetailsLoading) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                      width: AppSizes.getWidth(120, context),
                      height: AppSizes.getHeight(10, context),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16))),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
