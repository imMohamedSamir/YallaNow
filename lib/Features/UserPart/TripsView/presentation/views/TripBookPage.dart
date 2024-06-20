import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_book_cubit/trip_book_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripBookPageBody.dart';
import 'package:yallanow/generated/l10n.dart';

class TripBookPage extends StatelessWidget {
  const TripBookPage({super.key, required this.tripId});
  final String tripId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TripBookCubit(getIt.get<TripsRepoImpl>())..bookModel.tripId = tripId,
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).Book),
        body: const TripBookPageBody(),
      ),
    );
  }
}
