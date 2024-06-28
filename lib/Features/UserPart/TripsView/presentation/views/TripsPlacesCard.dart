import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_places_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/translate_cubit/translate_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsPlaceView.dart';

class TripsPlacesCard extends StatelessWidget {
  const TripsPlacesCard({super.key, required this.place});
  final TripPlacesModel place;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        NavigateToPage.slideFromRight(
            context: context, page: TripsPlaceView(name: place.name!));
      },
      child: Column(children: [
        TripsPlacesCardImg(img: chooseimg()),
        const SizedBox(height: 12),
        BlocBuilder<TranslateCubit, TranslateState>(
          builder: (context, state) {
            if (state is TranslateSuccess) {
              return Text(state.translatedText,
                  style: AppStyles.styleMedium14(context));
            } else {
              return Text(place.name!, style: AppStyles.styleMedium14(context));
            }
          },
        )
      ]),
    );
  }

  String chooseimg() {
    return place.images![Random().nextInt(2)];
  }
}

class TripsPlacesCardImg extends StatelessWidget {
  const TripsPlacesCardImg({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(80, context),
      width: AppSizes.getWidth(90, context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: img,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
