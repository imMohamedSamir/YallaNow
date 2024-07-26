import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/Repos/ScooterRequestRepoImpl.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/prom_code_cubit/prom_code_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/RidePaymentBody.dart';
import 'package:yallanow/generated/l10n.dart';

class RidePaymentView extends StatelessWidget {
  const RidePaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PromCodeCubit(getIt.get<ScooterRequestRepoImpl>()),
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).RidePayment),
        body: const RidePaymentBody(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
