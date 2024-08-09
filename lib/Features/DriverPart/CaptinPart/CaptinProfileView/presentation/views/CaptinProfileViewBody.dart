import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/models/captin_details_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/manager/captin_details_cubit/captin_details_cubit.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DriverImgSec.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/profileLoading.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinProfileViewBody extends StatelessWidget {
  const CaptinProfileViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<CaptinDetailsCubit, CaptinDetailsState>(
        builder: (context, state) {
          if (state is CaptinDetailsSuccess) {
            CaptinDetailsModel captinDetailsModel = state.captinModel;
            return Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: DriverImgSec(netImg: captinDetailsModel.imageUrl)),
                const Gap(16),
                Text(S.of(context).totalRating,
                    style: AppStyles.styleMedium16(context)),
                RatingBarIndicator(
                  rating: captinDetailsModel.riderRating!.toDouble(),
                  itemBuilder: (context, index) {
                    return const Icon(Icons.star_rate_rounded,
                        color: Colors.amber, size: 20.0);
                  },
                ),
                const Gap(24),
                CustomTextField(
                    initialValue: captinDetailsModel.riderName,
                    label: S.of(context).userName,
                    enabled: false),
                const Gap(16),
                CustomTextField(
                    initialValue: captinDetailsModel.phoneNumber,
                    label: S.of(context).PhoneNumber,
                    enabled: false),
                const Gap(16),
                CustomTextField(
                    initialValue: captinDetailsModel.address,
                    label: S.of(context).address,
                    enabled: false),
                const Gap(16),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            initialValue:
                                captinDetailsModel.totalTrips.toString(),
                            label: S.of(context).TotalTrips,
                            enabled: false)),
                    const Gap(16),
                    Expanded(
                        child: CustomTextField(
                            initialValue: "${captinDetailsModel.totalKillos}",
                            label: S.of(context).TotalKillos,
                            suffixIcon: Align(
                              alignment: AppLang.isArabic()
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Text(
                                "${S.of(context).Km}  ",
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            enabled: false)),
                  ],
                ),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).Wallet,
                  initialValue:
                      "${captinDetailsModel.walletBalance} ${S.of(context).EGP}",
                  enabled: false,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SvgPicture.asset(Assets.imagesWallet),
                  ),
                  suffixIconConstraints:
                      const BoxConstraints(maxHeight: 36, maxWidth: 46),
                ),
              ],
            );
          } else if (state is CaptinDetailsLoading) {
            return const ProfileLoading();
          } else if (state is CaptinDetailsFailure) {
            return Center(
              child: Text(state.errMsg),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
