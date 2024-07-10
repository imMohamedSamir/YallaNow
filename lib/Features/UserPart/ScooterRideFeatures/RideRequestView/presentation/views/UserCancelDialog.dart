import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/UserRidRequestCubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/DialogButton.dart';
import 'package:yallanow/generated/l10n.dart';

class UserCancelDialog extends StatefulWidget {
  const UserCancelDialog({super.key});

  @override
  UserCancelDialogState createState() => UserCancelDialogState();
}

class UserCancelDialogState extends State<UserCancelDialog> {
  List<String> reasons = [
    'Traffic',
    'Personal Emergency',
    'Vehicle Issue',
    'Customer No-show'
        'other'
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
            S.of(context).cancellationWarning,
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
            BlocProvider.of<UserRidRequestCubit>(context)
                .cancelRequest(context, reason: selectedReason!);
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
