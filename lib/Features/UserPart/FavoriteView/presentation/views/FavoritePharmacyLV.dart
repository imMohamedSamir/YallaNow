import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/FavoriteCardModel.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/fav_details_model/FavPharmacy.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/manager/fav_details_cubit/fav_details_cubit.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/views/FavoriteCard.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';

class FavoritePharmacyLV extends StatelessWidget {
  const FavoritePharmacyLV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavDetailsCubit, FavDetailsState>(
      builder: (context, state) {
        if (state is FavDetailsLoading) {
          return const MartsLoading();
        } else if (state is FavDetailsSuccess) {
          List<FavPharmacy> pharmacies = state.favDetailsModel.pharmacy ?? [];
          return ListView.builder(
            itemCount: pharmacies.length,
            itemBuilder: (context, index) {
              final isLastIndex = index == pharmacies.length - 1;
              return Padding(
                padding: EdgeInsets.only(bottom: isLastIndex ? 0 : 16),
                child: FavoriteCard(
                  favoriteCardModel:
                      FavoriteCardModel.fromPharmacy(pharmacies[index]),
                  partnerType: pharmacyType,
                ),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
