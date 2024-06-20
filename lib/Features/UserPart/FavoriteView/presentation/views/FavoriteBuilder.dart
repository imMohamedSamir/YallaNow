import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/views/FavoriteFoodLV.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/views/FavoriteMartsLV.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/presentation/views/FavoritePharmacyLV.dart';

class FavoriteBuilder extends StatelessWidget {
  const FavoriteBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 26),
      child: TabBarView(
        children: <Widget>[
          FavoriteFoodLV(),
          FavoriteMartsLV(),
          FavoritePharmacyLV()
        ],
      ),
    );
  }
}
