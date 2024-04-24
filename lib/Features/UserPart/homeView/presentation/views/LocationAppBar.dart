import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/basketIconBuilder.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';

class LocationAppBar extends StatelessWidget {
  const LocationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScooterLocationCubit, ScooterLocationState>(
      builder: (context, state) {
        return ListTile(
          horizontalTitleGap: 6,
          contentPadding: EdgeInsets.zero,
          leading: state is ScooterLocationGetLocation
              ? AspectRatio(
                  aspectRatio: 7 / 17,
                  child: SvgPicture.asset(Assets.imagesLocationIcon),
                )
              : const SizedBox(),
          title: state is ScooterLocationGetLocation
              ? Text("Deliver to", style: AppStyles.styleMedium16(context))
              : const SizedBox(),
          subtitle: state is ScooterLocationGetLocation
              ? Text(
                  "${state.locationData.locality!} - ${state.locationData.administrativeArea} - ${state.locationData.country}",
                  style: AppStyles.styleRegular12(context))
              : const SizedBox(),
          trailing: const BasketIconBuilder(),
        );
      },
    );
  }
}
// Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Container(
//                 width: AppSizes.getWidth(150, context),
//                 height: 16,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white,
//                 ),
//               ),
//             );