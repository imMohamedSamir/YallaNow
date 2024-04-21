import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/FoodView.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/CardDetailModel.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/RideCategCard.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/categCadDetaisl.dart';
import 'package:yallanow/main.dart';

class CategorySec extends StatelessWidget {
  const CategorySec({super.key});
  static List<CardCategDetails> details = [
    CardCategDetails(title: "Food", avgTime: "29 min", img: Assets.imagesFood),
    CardCategDetails(
        title: "Mart", avgTime: "30 min", img: Assets.imagesMarketbasket),
    CardCategDetails(
        title: "Pharmacy", avgTime: "29 min", img: Assets.imagesPharamcyLogo),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RideCateg(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              3,
              (index) => Padding(
                    padding: EdgeInsets.only(right: index == 2 ? 0 : 16),
                    child: GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FoodView()),
                          );
                        } else if (index == 1) {
                          Navigator.pushNamed(context, routesNames.markets);
                        } else if (index == 2) {
                          Navigator.pushNamed(
                              context, routesNames.pharmacyPage);
                        }
                      },
                      child: categCardDetails(
                        cardDetails: details[index],
                      ),
                    ),
                  )),
        ),
      ],
    );
  }
}
