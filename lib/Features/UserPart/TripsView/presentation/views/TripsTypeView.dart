import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trips_by_type_cubit/trips_by_type_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trips_popular_cubit/trips_popular_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsTypeViewBody.dart';

class TripsTypeView extends StatelessWidget {
  const TripsTypeView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              TripsByTypeCubit(getIt.get<TripsRepoImpl>())..get(type: name),
        ),
        BlocProvider(
            create: (context) =>
                TripsPopularCubit(getIt.get<TripsRepoImpl>())..get()),
      ],
      child: Scaffold(
        appBar: secondAppBar(context, title: name),
        body: const TripsTypeViewBody(),
      ),
    );
  }
}
