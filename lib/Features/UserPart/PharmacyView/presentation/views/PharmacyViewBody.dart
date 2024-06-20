import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacies_home_cubit/pharmacies_home_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmaciesSec.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyOffersSec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchBar.dart';

class PharmacyViewBody extends StatelessWidget {
  const PharmacyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PharmaciesHomeCubit>(context).getPharmacies();
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(child: PharmacySearchBar()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(child: PharmacyOffersSec()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24, bottom: 16),
            sliver: SliverToBoxAdapter(child: PharmaciesSec()),
          ),
        ],
      ),
    );
  }
}
