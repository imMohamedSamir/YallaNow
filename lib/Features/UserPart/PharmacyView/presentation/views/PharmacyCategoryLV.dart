import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/functions/randomColor.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/pharmacy_details_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_details_cubit/pharmacy_details_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyCategoryCard.dart';

class PharmacyCategoryLV extends StatelessWidget {
  const PharmacyCategoryLV({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(115, context),
      child: BlocBuilder<PharmacyDetailsCubit, PharmacyDetailsState>(
        builder: (context, state) {
          if (state is PharmacyDetailsSuccess) {
            List<PharmacyDetailsModel> categories = state.pharmacyDetails;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: index == categories.length - 1 ? 0 : 12.0),
                  child: PharmacyCategoryCard(
                    color: getRandomColor(),
                    categ: categories[index],
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
