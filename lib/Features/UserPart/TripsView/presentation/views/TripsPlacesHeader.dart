import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/places_info_cubit/places_info_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class TripsPlacesHeader extends StatelessWidget {
  const TripsPlacesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        S.of(context).places,
        style: AppStyles.styleMedium16(context),
      ),
      const Spacer(),
      BlocBuilder<PlacesInfoCubit, PlacesInfoState>(
        builder: (context, state) {
          if (state is PlacesInfoSuccess && state.places.length > 3) {
            return TextButton(
                onPressed: () {},
                child: Text(S.of(context).viewAll,
                    style: AppStyles.styleMedium14(context)
                        .copyWith(color: pKcolor)));
          } else {
            return const SizedBox();
          }
        },
      )
    ]);
  }
}
