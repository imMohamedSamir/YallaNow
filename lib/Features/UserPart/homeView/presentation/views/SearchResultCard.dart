import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/search_result_model.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/Functions/goToResutlPage.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/FavIcon.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({super.key, required this.resultModel, this.type});
  final SearchResultModel resultModel;
  final int? type;

//  CachedNetworkImage(
//                     height: AppSizes.getHeight(100, context),
//                     width: AppSizes.getWidth(100, context),
//                     fit: BoxFit.fill,
//                     imageUrl: resultModel.imageUrl!,
//                     errorWidget: (context, url, error) {
//                       return Text(" Coming soon!");
//                     },
//                   )
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(100, context),
      child: InkWell(
        onTap: () {
          if (type != null) {
            goToResutlPage(context, resultModel: resultModel, type: type);
          } else {
            goToResutlPage(context, resultModel: resultModel);
          }
        },
        child: Card(
            elevation: .2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                        imageUrl: resultModel.imageUrl!.contains("wwwroot")
                            ? "http://yallanow.runasp.net\\images\\c5840dc4-353d-4762-aa07-0bcd4e32c1f4_download.jpg"
                            : resultModel.imageUrl!,
                        height: AppSizes.getHeight(100, context),
                        width: AppSizes.getWidth(100, context),
                        fit: BoxFit.fill)),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(resultModel.name ?? "",
                          style: AppStyles.styleSemiBold16(context)),
                      const SizedBox(height: 4),
                      Text(resultModel.description ?? "",
                          style: AppStyles.styleRegular10(context)),
                      const SizedBox(height: 4),
                      Row(children: [
                        Icon(Icons.star_rate_rounded,
                            color: const Color(0xffFEC400),
                            size: AppSizes.getWidth(12, context)),
                        const SizedBox(width: 4),
                        Text(resultModel.rate.toString(),
                            style: AppStyles.styleRegular10(context))
                      ]),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.access_time_rounded,
                              color: const Color(0xff5A5A5A),
                              size: AppSizes.getHeight(12, context)),
                          const SizedBox(width: 4),
                          Text("${resultModel.deliveryTime} min",
                              style: AppStyles.styleRegular10(context)),
                          const SizedBox(width: 18),
                          Image.asset(Assets.imagesMotorbike,
                              width: AppSizes.getWidth(12, context),
                              height: AppSizes.getHeight(12, context)),
                          const SizedBox(width: 4),
                          Text(resultModel.deliveryFees.toString(),
                              style: AppStyles.styleRegular10(context)),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
                const FavIcon()
              ],
            )),
      ),
    );
  }
}
