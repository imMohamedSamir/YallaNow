import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/FavoriteView/presentation/views/FavoriteFoodLV.dart';
import 'package:yallanow/Features/FavoriteView/presentation/views/FavoriteMartsLV.dart';
import 'package:yallanow/Features/FavoriteView/presentation/views/FavoritePharmacyLV.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: favoriteAppBar(context, title: 'Favorite'),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 26),
          child: TabBarView(
            children: <Widget>[
              FavoriteFoodLV(),
              FavoriteMartsLV(),
              FavoritePharmacyLV()
            ],
          ),
        ),
      ),
    );
  }
}
