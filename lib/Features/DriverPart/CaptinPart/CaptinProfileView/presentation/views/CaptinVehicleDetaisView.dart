import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepoImpl.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_details_cubit/captin_details_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/views/CaptinVehicleDetailsViewBody.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinVehicleDetaisView extends StatelessWidget {
  const CaptinVehicleDetaisView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CaptinDetailsCubit(getIt.get<CaptinRequestRepoImpl>())..get(),
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).VehicleDetails),
        body: const CaptinVehicleDetailsViewBody(),
      ),
    );
  }
}
