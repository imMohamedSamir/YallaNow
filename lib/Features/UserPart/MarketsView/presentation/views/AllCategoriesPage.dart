import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/MarketCategoriesModel.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketCategoriesCard.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: categoryAppBar(context, title: "Marts"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: AllCategoriesGV(),
      ),
    );
  }
}

class AllCategoriesGV extends StatelessWidget {
  const AllCategoriesGV({super.key});
  static List<MarketCategoriesModel> data = [
    MarketCategoriesModel(name: "Fruits & Veg", img: Assets.imagesMarketcateg1),
    MarketCategoriesModel(name: "Bakery", img: Assets.imagesMarketcateg2),
    MarketCategoriesModel(
        name: "Meat, poultry & seafood", img: Assets.imagesMarketcateg3),
    MarketCategoriesModel(name: "Bakery", img: Assets.imagesMarketcateg2),
    MarketCategoriesModel(name: "Fruits & Veg", img: Assets.imagesMarketcateg1),
    MarketCategoriesModel(name: "Bakery", img: Assets.imagesMarketcateg2),
    MarketCategoriesModel(
        name: "Meat, poultry & seafood", img: Assets.imagesMarketcateg3),
    MarketCategoriesModel(name: "Fruits & Veg", img: Assets.imagesMarketcateg1),
    MarketCategoriesModel(name: "Bakery", img: Assets.imagesMarketcateg2),
    MarketCategoriesModel(name: "Fruits & Veg", img: Assets.imagesMarketcateg1),
    MarketCategoriesModel(name: "Bakery", img: Assets.imagesMarketcateg2),
    MarketCategoriesModel(
        name: "Meat, poultry & seafood", img: Assets.imagesMarketcateg3),
    MarketCategoriesModel(name: "Fruits & Veg", img: Assets.imagesMarketcateg1),
    MarketCategoriesModel(name: "Bakery", img: Assets.imagesMarketcateg2),
    MarketCategoriesModel(name: "Fruits & Veg", img: Assets.imagesMarketcateg1),
    MarketCategoriesModel(name: "Bakery", img: Assets.imagesMarketcateg2),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16, crossAxisSpacing: 16, crossAxisCount: 3),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return MarketCategoriesCard(
          marketCategoriesModel: data[index],
        );
      },
    );
  }
}
