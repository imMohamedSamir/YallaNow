import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/Repo/PharmacyRepoImpl.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_details_cubit/pharmacy_details_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyPageBody.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBar.dart';

class PharmacyPage extends StatelessWidget {
  const PharmacyPage({
    super.key,
    required this.pharmacy,
  });
  final PharmacyModel pharmacy;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemPageCubit(),
        ),
        BlocProvider(
          create: (context) =>
              PharmacyDetailsCubit(getIt.get<PharmacyRepoImpl>())
                ..getPharmacyDetails(context, pharmacyModel: pharmacy),
        ),
      ],
      child: Scaffold(
        body: PharmacyPageBody(pharmacy: pharmacy),
        bottomNavigationBar: const FoodBottomBarTest(),
      ),
    );
  }
}
