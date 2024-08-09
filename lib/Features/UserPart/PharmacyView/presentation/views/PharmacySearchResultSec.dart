import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_search_cubit/pharmacy_search_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodSearchResultLV.dart';
import 'package:yallanow/generated/l10n.dart';

class PharmacySearchResultSec extends StatelessWidget {
  const PharmacySearchResultSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<PharmacySearchCubit, PharmacySearchState>(
            builder: (context, state) {
              if (state is PharmacySearchSuccess && state.results.isNotEmpty) {
                return Text(S.of(context).Results,
                    style: AppStyles.styleMedium16(context));
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(height: 16),
          const FoodSearchResultLV()
        ],
      ),
    );
  }
}
