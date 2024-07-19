import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_details_cubit/captin_details_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/views/CaptinProfileOptionsDetails.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/views/DriverDetails.dart';

class DriverCaptinDrawer extends StatelessWidget {
  const DriverCaptinDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CaptinDetailsCubit>(context).get();
    return const Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 45, horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 12),
            DriverDetails(),
            SizedBox(height: 12),
            CaptinProfileOptionsDetails()
          ],
        ),
      ),
    );
  }
}
