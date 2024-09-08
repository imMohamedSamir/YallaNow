import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/Repo/PharmacyRepoImpl.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacies_home_cubit/pharmacies_home_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_offers_cubit/pharmacy_offers_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyViewBody.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBar.dart';
import 'package:yallanow/generated/l10n.dart';

class PharmacyView extends StatelessWidget {
  const PharmacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PharmaciesHomeCubit(getIt.get<PharmacyRepoImpl>())
                ..getPharmacies(),
        ),
        BlocProvider(
          create: (context) =>
              PharmacyOffersCubit(getIt.get<PharmacyRepoImpl>())..get(),
        ),
      ],
      child: Scaffold(
        appBar: categoryAppBar(context, title: S.of(context).Pharamcies),
        body: const PharmacyViewBody(),
        bottomSheet: const FoodBottomBarTest(),
      ),
    );
  }
}
