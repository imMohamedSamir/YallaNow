import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_ride_request_cubit/captin_ride_request_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/ready_for_trips_cubit/ready_for_trips_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_map_cubit/captin_map_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/DialogButton.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinCancelDialog extends StatefulWidget {
  const CaptinCancelDialog({super.key});

  @override
  CaptinCancelDialogState createState() => CaptinCancelDialogState();
}

class CaptinCancelDialogState extends State<CaptinCancelDialog> {
  List<String> reasons = [
    'Traffic',
    'Personal Emergency',
    'Vehicle Issue',
    'Customer No-show'
  ];
  String? selectedReason;
  @override
  void initState() {
    selectedReason = reasons[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).cancelRidequestion,
        style: AppStyles.styleSemiBold16(context)
            .copyWith(color: const Color(0xff240301)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).cancelRideMsg,
            style: AppStyles.styleRegular16(context)
                .copyWith(color: const Color(0xff5A5A5A)),
          ),
          const SizedBox(height: 16),
          ...reasons.map((reason) => RadioListTile<String>(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                activeColor: pKcolor,
                title: Text(reason),
                value: reason,
                groupValue: selectedReason,
                onChanged: (value) {
                  setState(() {
                    selectedReason = value;
                  });
                },
              )),
        ],
      ),
      actions: [
        DialogButton(
          btnColor: pKcolor,
          textColor: Colors.white,
          text: S.of(context).Cancel,
          onPressed: () {
            BlocProvider.of<CaptinMapCubit>(context).cancelListening();
            BlocProvider.of<ReadyForTripsCubit>(context).stopListening();
            BlocProvider.of<CaptinRideRequestCubit>(context)
                .cancelRequest(context, reason: selectedReason!);
            BlocProvider.of<CaptinRideRequestCubit>(context).disconnect();
          },
        ),
        DialogButton(
          btnColor: Colors.white,
          textColor: pKcolor,
          text: S.of(context).Iwait,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
