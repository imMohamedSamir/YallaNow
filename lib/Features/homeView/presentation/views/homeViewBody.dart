import 'package:flutter/material.dart';
import 'package:yallanow/Features/homeView/presentation/views/LocationAppBar.dart';
import 'package:yallanow/Features/homeView/presentation/views/OffersPageView.dart';
import 'package:yallanow/Features/homeView/presentation/views/SearchBar.dart';
import 'package:yallanow/Features/homeView/presentation/views/categorySec.dart';
import 'package:yallanow/Features/homeView/presentation/views/offersSec.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const LocationAppBar(),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 12),
            HomeSearchBar(),
            SizedBox(height: 13),
            CategorySec(),
            SizedBox(height: 24),
            OffersSec()
          ],
        ),
      ),
    );
  }
}
