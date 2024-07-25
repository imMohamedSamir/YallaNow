import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/TripInfoModel.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_details_cubit.dart/trip_details_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class TripDescription extends StatelessWidget {
  const TripDescription({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripDetailsCubit, TripDetailsState>(
      builder: (context, state) {
        if (state is TripDetailsSuccess) {
          TripInfoModel trip = state.trip;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppSizes.getWidth(230, context),
                      child: Text(
                        trip.name ?? "",
                        style: AppStyles.styleSemiBold20(context),
                      ),
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        Container(
                          width: AppSizes.getWidth(32, context),
                          height: AppSizes.getHeight(32, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffF0F0F0)),
                          child: const Icon(Icons.location_on_sharp,
                              color: pKcolor, size: 20),
                        ),
                        const Gap(6),
                        Text(trip.destniation ?? '',
                            style: AppStyles.styleMedium16(context)
                                .copyWith(color: scColor))
                      ],
                    ),
                    const Gap(6),
                    Row(
                      children: [
                        Container(
                          width: AppSizes.getWidth(32, context),
                          height: AppSizes.getHeight(32, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffF0F0F0)),
                          child: const Icon(Icons.access_time_filled_outlined,
                              color: Color(0xff24C6C6), size: 20),
                        ),
                        const Gap(6),
                        Text("${S.of(context).Duration}: ${trip.duration}",
                            style: AppStyles.styleMedium16(context)
                                .copyWith(color: scColor))
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                      color: grayColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Text("${trip.price} ${trip.currency}",
                          style: AppStyles.styleBold18(context)),
                      const Gap(3),
                      Text(S.of(context).PerPerson,
                          style: AppStyles.styleRegular14(context)
                              .copyWith(color: scColor)),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
