import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_search_cubit/home_search_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomeSearchResultLV.dart';

class HomeSearchResultSec extends StatelessWidget {
  const HomeSearchResultSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<HomeSearchCubit, HomeSearchState>(
            builder: (context, state) {
              if (state is HomeSearchSuccess && state.results.isNotEmpty) {
                return Text("Results", style: AppStyles.styleMedium16(context));
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(height: 16),
          const HomeSearchResultLV()
        ],
      ),
    );
  }
}
