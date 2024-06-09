import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacies_home_cubit/pharmacies_home_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyCard.dart';

class PharmaciesLV extends StatelessWidget {
  const PharmaciesLV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmaciesHomeCubit, PharmaciesHomeState>(
      builder: (context, state) {
        if (state is PharmaciesHomeSuccess) {
          List<PharmacyModel> pharmacies = state.pharmacies;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: pharmacies.length,
            itemBuilder: (context, index) {
              final isLastIndex = index == pharmacies.length - 1;
              return Padding(
                padding: EdgeInsets.only(bottom: isLastIndex ? 0 : 16),
                child: PharmacyCard(
                  pharmacyModel: pharmacies[index],
                ),
              );
            },
          );
        } else if (state is PharmaciesHomeLoading) {
          return const MartsLoading();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
