import 'package:flutter/material.dart';
import 'package:yallanow/Features/homeView/presentation/views/LocationAppBar.dart';
import 'package:yallanow/Features/homeView/presentation/views/SearchBar.dart';
import 'package:yallanow/Features/homeView/presentation/views/categorySec.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const LocationAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 12),
            HomeSearchBar(),
            const SizedBox(height: 13),
            CategorySec()
          ],
        ),
      ),
    );
  }
}
