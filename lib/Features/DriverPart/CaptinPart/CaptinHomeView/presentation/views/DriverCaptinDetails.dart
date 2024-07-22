import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/models/captin_drawer_details_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/manager/captin_drawer_cubit/captin_drawer_cubit.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/views/CaptinLoading.dart';

class DriverCaptinDetails extends StatelessWidget {
  const DriverCaptinDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaptinDrawerCubit, CaptinDrawerState>(
      builder: (context, state) {
        if (state is CaptinDrawerSuccess) {
          CaptinDrawerDetailsModel detailsModel = state.detailsModel;
          return Row(
            children: [
              ClipOval(
                child: Image.network(
                  detailsModel.image!,
                  width: AppSizes.getWidth(70, context),
                  height: AppSizes.getHeight(70, context),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(detailsModel.name ?? "",
                      style: AppStyles.styleRegular16(context)),
                  DriverRatingIndicator(
                      rate: detailsModel.rating?.toDouble() ?? 0)
                ],
              )
            ],
          );
        } else if (state is CaptinDrawerLoading) {
          return const CaptinLoading();
        } else {
          return const CaptinLoading();
        }
      },
    );
  }
}

class DriverRatingIndicator extends StatelessWidget {
  const DriverRatingIndicator({
    super.key,
    required this.rate,
  });
  final double rate;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rate,
      itemCount: 5,
      unratedColor: Colors.grey,
      itemSize: 26,
      itemBuilder: (context, index) {
        return const Icon(Icons.star_rate_rounded, color: Color(0xffFEC400));
      },
    );
  }
}
