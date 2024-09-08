import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/getPadding.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_home_cubit/mart_home_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/SuperMarketCard.dart';
import 'package:yallanow/generated/l10n.dart';

class SuperMarketsSec extends StatelessWidget {
  const SuperMarketsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MartHomeCubit, MartHomeState>(
      builder: (context, state) {
        if (state is MartHomeSuccess && state.marts.isNotEmpty) {
          final marts = state.marts;
          return SliverPadding(
            padding: const EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).SuperMarkets,
                      style: AppStyles.styleMedium16(context)),
                  const SizedBox(height: 24),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: marts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: getPadding(
                            index: index,
                            lastIndex: marts.length - 1,
                            paddingValue: 12),
                        child: SuperMarketCard(martsModel: marts[index]),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        } else if (state is MartHomeLoading) {
          return const SliverToBoxAdapter(child: MartsLoading());
        } else {
          return SliverToBoxAdapter(
              child: Column(
            children: [
              const Gap(50),
              Image.asset(Assets.imagesComingSoon3),
              const Gap(16),
              Center(
                child: Text(
                  S.of(context).MartsEmptyMsg,
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: pKcolor),
                ),
              ),
            ],
          ));
        }
      },
    );
  }
}
