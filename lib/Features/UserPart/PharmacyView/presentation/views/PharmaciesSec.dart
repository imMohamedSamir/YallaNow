import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacies_home_cubit/pharmacies_home_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyCard.dart';
import 'package:yallanow/generated/l10n.dart';

class PharmaciesSec extends StatelessWidget {
  const PharmaciesSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmaciesHomeCubit, PharmaciesHomeState>(
      builder: (context, state) {
        if (state is PharmaciesHomeSuccess && state.pharmacies.isNotEmpty) {
          final pharmacies = state.pharmacies;

          return SliverPadding(
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            sliver: SliverToBoxAdapter(
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).Pharamcies,
                        style: AppStyles.styleMedium16(context)),
                    const SizedBox(height: 24),
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: pharmacies.length,
                        itemBuilder: (context, index) {
                          final isLastIndex = index == pharmacies.length - 1;
                          return Padding(
                            padding:
                                EdgeInsets.only(bottom: isLastIndex ? 0 : 16),
                            child:
                                PharmacyCard(pharmacyModel: pharmacies[index]),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (state is PharmaciesHomeLoading) {
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
                  S.of(context).PharmaciesEmptyMsg,
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
