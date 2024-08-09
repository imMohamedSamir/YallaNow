import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/functions/getPadding.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/marts_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_home_cubit/mart_home_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/SuperMarketCard.dart';

class SuperMarketsLV extends StatelessWidget {
  const SuperMarketsLV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MartHomeCubit, MartHomeState>(
      builder: (context, state) {
        if (state is MartHomeSuccess) {
          List<MartsModel> marts = state.marts;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: marts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: getPadding(
                    index: index,
                    lastIndex: marts.length - 1,
                    paddingValue: 12),
                child: SuperMarketCard(
                  martsModel: marts[index],
                ),
              );
            },
          );
        } else if (state is MartHomeLoading) {
          return const MartsLoading();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
