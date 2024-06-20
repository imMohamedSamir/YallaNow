import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/FavoriteCardModel.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/fav_details_model/FavRestaurant.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/manager/fav_details_cubit/fav_details_cubit.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/views/FavoriteCard.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsLoading.dart';

class FavoriteFoodLV extends StatelessWidget {
  const FavoriteFoodLV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavDetailsCubit, FavDetailsState>(
      builder: (context, state) {
        if (state is FavDetailsLoading) {
          return const MartsLoading();
        } else if (state is FavDetailsSuccess) {
          List<FavRestaurant> resutrants =
              state.favDetailsModel.restaurant ?? [];
          return ListView.builder(
            itemCount: resutrants.length,
            itemBuilder: (context, index) {
              final isLastIndex = index == resutrants.length - 1;
              return Padding(
                padding: EdgeInsets.only(bottom: isLastIndex ? 0 : 16),
                child: FavoriteCard(
                    favoriteCardModel:
                        FavoriteCardModel.fromRestaurant(resutrants[index]),
                    partnerType: resturantType),
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
