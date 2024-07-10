import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinRequestModel.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_ride_request_cubit/captin_ride_request_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinRequestBS.dart';

class CaptinRequestBuilder extends StatelessWidget {
  const CaptinRequestBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaptinRideRequestCubit, CaptinRideRequestState>(
      builder: (context, state) {
        Offset offset;
        double opacity;
        Duration duration = const Duration(milliseconds: 650);
        var data =
            state is CaptinRideRequestjAccepted ? state.detailsModel : null;
        if (state is CaptinRideRequestjAccepted) {
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
              maxChildSize: .49,
              builder: (context, scrollController) {
                if (state is CaptinRideRequestjAccepted) {
                  return CaptinRequestBS(
                    scrollController: scrollController,
                    requestDetails: data ?? CaptinRequestModel(),
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
