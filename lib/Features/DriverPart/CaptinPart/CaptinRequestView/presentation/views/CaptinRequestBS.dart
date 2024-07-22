import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepoImpl.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinRequestModel.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_ride_request_cubit/captin_ride_request_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/CaptinSrcDstSec.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_map_cubit/captin_map_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_start_trip_cubit/captin_start_trip_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinMapSec.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinStartSlide.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/MapsNavigation.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/Functions/launchURL.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinRequestBS extends StatelessWidget {
  const CaptinRequestBS(
      {super.key,
      this.scrollController,
      required this.requestDetails,
      this.isAccepted = false});
  final ScrollController? scrollController;
  final CaptinRequestModel requestDetails;
  final bool isAccepted;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CaptinRideRequestCubit>(context);

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: SingleChildScrollView(
          controller: scrollController ?? null,
          child: BlocProvider(
            create: (context) =>
                CaptinStartTripCubit(getIt.get<CaptinRequestRepoImpl>()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${requestDetails.price} EGP",
                      style: AppStyles.styleBold24(context)
                          .copyWith(color: blackdcolor),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () async {
                          if (isAccepted) {
                            cancelDriverRidedialogMethode(context);
                          } else {
                            await cubit.captinResponseMethod(
                                tripId: requestDetails.tripId!,
                                isAccepted: false);
                            if (!context.mounted) return;
                            Navigator.pop(context);
                          }
                        },
                        icon:
                            const Icon(Icons.cancel, size: 28, color: pKcolor))
                  ],
                ),
                const SizedBox(height: 16),
                CaptinSrcDstSec(
                  src: requestDetails.location,
                  dst: requestDetails.destination,
                ),
                const SizedBox(height: 8),
                const Divider(),
                Row(
                  children: [
                    Text(
                      "${requestDetails.firstName} ${requestDetails.lastName}",
                      style: AppStyles.styleMedium14(context),
                    ),
                    const Spacer(),
                    Text(
                      requestDetails.phoneNumber ?? "",
                      style: AppStyles.styleMedium14(context),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          launchURL("tel:${requestDetails.phoneNumber}");
                        },
                        icon: const Icon(Icons.call, size: 20))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      getGender(gender: requestDetails.gender ?? "Male"),
                      style: AppStyles.styleMedium14(context),
                    ),
                    const Gap(8),
                    if (requestDetails.gender == "Male" ||
                        requestDetails.gender == "male")
                      const Icon(Icons.male_outlined, color: Colors.blueAccent)
                    else
                      const Icon(Icons.female_outlined,
                          color: Colors.pinkAccent)
                  ],
                ),
                // const Divider(),

                const Divider(),
                Text(S.of(context).PaymentMethod,
                    style: AppStyles.styleMedium18(context)),
                const SizedBox(height: 8),
                Text(
                  getPaymentMethod(
                      method: requestDetails.paymentMethod ?? "Cash"),
                  style: AppStyles.styleMedium16(context),
                ),
                // const Spacer(),

                if (isAccepted)
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      BlocBuilder<CaptinMapCubit, CaptinMapState>(
                        builder: (context, state) {
                          if (state is CaptinMapChange &&
                                  state.distance! <= 40 ||
                              state is CaptinMapInitial) {
                            return CaptinSlideAction(
                                tripId: requestDetails.tripId!);
                          } else if (state is CaptinMapChange &&
                              state.isStarted!) {
                            return CaptinSlideAction(
                                isStarted: true,
                                tripId: requestDetails.tripId!);
                          } else {
                            return const MapsNavigation();
                          }
                        },
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      const Gap.expand(50),
                      CustomButton(
                        text: S.of(context).Accept,
                        txtcolor: Colors.white,
                        btncolor: pKcolor,
                        onPressed: () async {
                          await cubit.acceptMethod(context,
                              requestModel: requestDetails);
                          if (!context.mounted) return;
                          Navigator.pop(context);
                          NavigateToPage.slideFromRight(
                              context: context, page: const CaptinMapSec());
                        },
                      ),
                      const SizedBox(height: 6)
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getPaymentMethod({required String method}) {
    if (AppLang.isArabic()) {
      if (method == "Cash") {
        return "نقدى";
      } else if (method == "wallet") {
        return "محفظة";
      } else {
        return "فيزا";
      }
    } else {
      return method;
    }
  }

  String getGender({required String gender}) {
    if (AppLang.isArabic()) {
      if (gender == "Male" || gender == "male") {
        return "ذكر";
      } else {
        return "اثنى";
      }
    } else {
      return gender;
    }
  }
}
