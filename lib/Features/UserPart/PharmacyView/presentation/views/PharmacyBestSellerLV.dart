import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_details_cubit/pharmacy_details_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyItemDetails.dart';

class PharmacyGeneralLV extends StatelessWidget {
  const PharmacyGeneralLV({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(203, context),
      child: BlocBuilder<PharmacyDetailsCubit, PharmacyDetailsState>(
        builder: (context, state) {
          if (state is PharmacyDetailsSuccess) {
            List items = state.pharmacyDetails[0].items ?? [];
            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index == 9 ? 0 : 12.0),
                  child: PharmacyItemDetails(
                    item: items[index],
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
