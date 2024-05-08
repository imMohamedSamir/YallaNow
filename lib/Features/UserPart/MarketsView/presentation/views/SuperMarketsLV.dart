import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/marts_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_home_cubit/mart_home_cubit.dart';
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
              final isLastIndex = index == marts.length - 1;
              return Padding(
                padding: EdgeInsets.only(
                  bottom: isLastIndex
                      ? 0
                      : 16, // Set bottom padding to 0 for the last item
                ),
                child: SuperMarketCard(
                  martsModel: marts[index],
                ),
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
