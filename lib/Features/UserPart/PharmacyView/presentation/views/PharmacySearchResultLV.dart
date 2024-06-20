import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_search_cubit/pharmacy_search_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchResultCard.dart';

class PharmacySearchResultLV extends StatelessWidget {
  const PharmacySearchResultLV({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PharmacySearchCubit, PharmacySearchState>(
        builder: (context, state) {
          if (state is PharmacySearchSuccess) {
            final results = state.results;
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: results.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchResultCard(resultModel: results[index], type: 0);
              },
            );
          } else if (state is PharmacySearchLoading) {
            return const MartsLoading();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
