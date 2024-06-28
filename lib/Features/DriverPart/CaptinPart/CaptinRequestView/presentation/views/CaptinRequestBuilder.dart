import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/ride_request_cubit/CaptinRequestCubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinRequestBS.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/scooter_request_cubit.dart';

class CaptinRequestBuilder extends StatelessWidget {
  const CaptinRequestBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaptinRequestCubit, CaptinRequestState>(
      builder: (context, state) {
        Offset offset;
        double opacity;
        Duration duration = const Duration(milliseconds: 650);
        var data = state is CaptinRequestAccepted ? state.requestDetails : null;
        if (state is CaptinRequestAccepted) {
          offset = const Offset(0, 0);
          opacity = 1.0;
        } else {
          offset = const Offset(0, 1);
          opacity = 0;
        }
        return AnimatedSlide(
          offset: offset,
          duration: duration,
          child: AnimatedOpacity(
            opacity: opacity,
            duration: duration,
            child: DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.11,
              maxChildSize: .42,
              builder: (context, scrollController) {
                if (state is CaptinRequestAccepted) {
                  return CaptinRequestBS(
                    scrollController: scrollController,
                    requestDetails: data!,
                    isAccepted: true,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
