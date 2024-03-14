import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class CategorySec extends StatelessWidget {
  const CategorySec({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: EdgeInsets.only(
                          right: index == 2 ? 0 : 16,
                        ),
                        child: CategoryCard(),
                      )),
            ),
          )
        ],
      ),
    );
  }
}

class RideCateg extends StatelessWidget {
  const RideCateg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              Text("Food", style: AppStyles.styleSemiBold16(context)),
              Text("29 min.", style: AppStyles.styleRegular10(context))
            ],
          ),
          AspectRatio(
            aspectRatio: .1,
            child: Image.asset(
              Assets.imagesFood,
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }
}
