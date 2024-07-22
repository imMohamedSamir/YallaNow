import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/presentation/manager/cubit/user_ride_history_cubit.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/presentation/views/RidesHistoryViewBody.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/Repo/ScooterRideRepoImpl.dart';
import 'package:yallanow/generated/l10n.dart';

class UserRidesHistoryView extends StatelessWidget {
  const UserRidesHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserRideHistoryCubit(getIt.get<ScooterRideRepoImpl>())..get(),
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).RidesHistory),
        body: const RidesHistoryViewBody(),
      ),
    );
  }
}
