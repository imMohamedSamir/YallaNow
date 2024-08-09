import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_resturants_cubit/fetch_popular_resturants_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularLoading.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularResturansLV.dart';
import 'package:yallanow/generated/l10n.dart';

class PopularResturansSec extends StatelessWidget {
  const PopularResturansSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPopularResturantsCubit,
        FetchPopularResturantsState>(
      builder: (context, state) {
        if (state is FetchPopularResturantsSuccess) {
          if (state.resturants.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }
          return SliverPadding(
            padding: const EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).PopularResturants,
                      style: AppStyles.styleMedium16(context)),
                  PopularResturansLV(resturants: state.resturants)
                ],
              ),
            ),
          );
        } else if (state is FetchPopularResturantsLoading) {
          return const SliverToBoxAdapter(
            child: PopularLoading(),
          );
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          );
        }
      },
    );
  }
}
