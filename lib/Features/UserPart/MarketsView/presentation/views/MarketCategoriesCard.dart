import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
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
        NavigateToPage.slideFromRightAndFade(
            context: context,
            page: MartsCategoryItemsPage(categ: marketCategoriesModel));
      },
      child: Container(
          height: AppSizes.getHeight(80, context),
          width: MediaQuery.sizeOf(context).width / 3 - 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffF5F5F5),
          ),
          child: Column(
            children: [
              const Gap(6),
              SizedBox(
                width: AppSizes.getWidth(85, context),
                child: Text(marketCategoriesModel.name!,
                    style: AppStyles.styleMedium14(context)
                        .copyWith(color: const Color(0xff5A5A5A))),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: url,
                      height: AppSizes.getHeight(60, context),
                      width: AppSizes.getWidth(80, context),
                      fit: BoxFit.fill,
                    )),
              ),
            ],
          )),
    );
  }
}
