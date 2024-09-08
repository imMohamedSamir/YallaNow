import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/fetch_popular_marts_cubit/fetch_popular_marts_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularLoading.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/PopularMartsLV.dart';
import 'package:yallanow/generated/l10n.dart';

class PopularMartsSec extends StatelessWidget {
  const PopularMartsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPopularMartsCubit, FetchPopularMartsState>(
      builder: (context, state) {
        if (state is FetchPopularMartsSuccess) {
          if (state.marts.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }
          return SliverPadding(
            padding: const EdgeInsets.only(top: 16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).PopularMarts,
                      style: AppStyles.styleMedium16(context)),
                  const SizedBox(height: 16),
                  PopularMartsLV(marts: state.marts)
                ],
              ),
            ),
          );
        } else if (state is FetchPopularMartsLoading) {
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
