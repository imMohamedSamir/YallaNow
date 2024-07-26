import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/UserRidRequestCubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/send_request_cubit/send_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRideBS.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/DriverInfoPanel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/FindingRideView.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';

class ChooseRideType extends StatelessWidget {
  const ChooseRideType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScooterLocationCubit, ScooterLocationState>(
      builder: (context, state) {
        // if (state is ScooterLocationFailuer) {
        //   return _buildFailureSheet(context, state.errmsg);
        // }
        return _buildRideTypeSheet(context);
      },
    );
  }

  Widget _buildFailureSheet(BuildContext context, String errorMessage) {
    return DraggableScrollableSheet(
      initialChildSize: 0.30,
      minChildSize: 0.13,
      maxChildSize: 0.70,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Text(
                "$errorMessage\nplease try again and choose correct place",
                style: AppStyles.styleBold16(context),
                textAlign: TextAlign.center,
              ),
            ));
      },
    );
  }

  Widget _buildRideTypeSheet(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      initialChildSize: 0.30,
      minChildSize: 0.13,
      maxChildSize: 0.55,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: const Icon(Icons.drag_handle),
                ),
                BlocBuilder<UserRidRequestCubit, UserRideRequestState>(
                  builder: (context, userRequestState) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child:
                          _buildUserRequestContent(context, userRequestState),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildUserRequestContent(
      BuildContext context, UserRideRequestState userRequestState) {
    if (userRequestState is UserRideRequestAccepted) {
      // return const AvailableRideBS();

      return DriverInfoPanel(driverInfoModel: userRequestState.driverInfoModel);
    } else {
      return BlocBuilder<SendRequestCubit, SendRequestState>(
        builder: (context, sendRequestState) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeInOut,
            child: _buildSendRequestContent(context, sendRequestState),
          );
        },
      );
    }
  }

  Widget _buildSendRequestContent(
      BuildContext context, SendRequestState sendRequestState) {
    if (sendRequestState is SendRequestSuccess) {
      var request = sendRequestState.requestModel;
      // return const AvailableRideBS();

      return FindingRideView(requestModel: request);
    } else if (sendRequestState is SendRequestFailure) {
      return Center(
        child: Text(sendRequestState.errMsg,
            textAlign: TextAlign.center,
            style: AppStyles.styleBold16(context).copyWith(color: pKcolor)),
      );
    } else {
      return const AvailableRideBS();
    }
  }
}
