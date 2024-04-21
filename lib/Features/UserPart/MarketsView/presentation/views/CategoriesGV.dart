import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/MarketCategoriesModel.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/CategoryPage.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketCategoriesCard.dart';

class CategoriesGV extends StatelessWidget {
  const CategoriesGV({super.key});
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
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16, crossAxisSpacing: 16, crossAxisCount: 3),
      itemCount: data.length,
      itemBuilder: (context, index) {
        if (index < 9) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MarketCategoryPage(),
                  ));
            },
            child: MarketCategoriesCard(
              marketCategoriesModel: data[index],
            ),
          );
        } else {
          return null;
        }
      },
    );
  }
}
