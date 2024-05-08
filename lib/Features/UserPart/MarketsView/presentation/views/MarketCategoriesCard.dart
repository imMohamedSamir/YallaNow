import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/mart_details_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsCategoryItemsPage.dart';

class MarketCategoriesCard extends StatelessWidget {
  const MarketCategoriesCard({super.key, required this.marketCategoriesModel});
  final MartDetailsModel marketCategoriesModel;
  @override
  Widget build(BuildContext context) {
    String url = marketCategoriesModel.icon!.replaceAll('\\', '/');
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MartsCategoryItemsPage(categ: marketCategoriesModel),
            ));
      },
      child: Container(
          height: AppSizes.getHeight(80, context),
          width: MediaQuery.sizeOf(context).width / 3 - 25,
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffF5F5F5),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 8,
                  left: 10,
                  child: SizedBox(
                    width: AppSizes.getWidth(85, context),
                    child: Text(marketCategoriesModel.name!,
                        style: AppStyles.styleMedium12(context)
                            .copyWith(color: const Color(0xff5A5A5A))),
                  )),
              const SizedBox(height: 6),
              Positioned(
                bottom: 6,
                right: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    url,
                    height: AppSizes.getHeight(60, context),
                    width: AppSizes.getWidth(80, context),
                    fit: BoxFit.contain,
                  ),
                ),
                // Image.network(src)
              ),
            ],
          )),
    );
  }
}
