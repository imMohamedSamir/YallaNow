import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_search_cubit/home_search_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchResultCard.dart';

class HomeSearchResultLV extends StatelessWidget {
  const HomeSearchResultLV({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeSearchCubit, HomeSearchState>(
        builder: (context, state) {
          if (state is HomeSearchSuccess) {
            final results = state.results;
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: results.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchResultCard(resultModel: results[index]);
              },
            );
          } else if (state is HomeSearchLoading) {
            return const MartsLoading();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
