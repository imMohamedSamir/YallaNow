import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/MarketsView/data/models/BradnsModel.dart';
import 'package:yallanow/Features/MarketsView/presentation/views/MartsBrandsCard.dart';

class MartsBrandsLV extends StatelessWidget {
  const MartsBrandsLV({super.key});
  static List<BradnsModel> brands = [
    BradnsModel(name: "Juhayna", img: Assets.imagesMarketOffer),
    BradnsModel(name: "OXI", img: Assets.imagesMarketOffer),
    BradnsModel(name: "Juhayna", img: Assets.imagesMarketcateg2),
    BradnsModel(name: "OXI", img: Assets.imagesMarketOffer),
    BradnsModel(name: "Juhayna", img: Assets.imagesMarketcateg2),
    BradnsModel(name: "OXI", img: Assets.imagesMarketOffer)
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(190, context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(right: index == brands.length - 1 ? 0 : 12.0),
            child: MartsBrandsCard(
              bradnsModel: brands[index],
            ),
          );
        },
      ),
    );
  }
}
