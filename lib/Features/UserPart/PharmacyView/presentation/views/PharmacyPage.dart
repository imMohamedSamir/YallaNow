import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyPageBody.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBar.dart';

class PharmacyPage extends StatelessWidget {
  const PharmacyPage({super.key, required this.pharmacy});
  final PharmacyModel pharmacy;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemPageCubit(),
      child: Scaffold(
        body: PharmacyPageBody(pharmacy: pharmacy),
        bottomNavigationBar: const FoodBottomBar(),
      ),
    );
  }
}
