import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_popular_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripPage.dart';
import 'package:yallanow/generated/l10n.dart';

class TripsPopularCard extends StatelessWidget {
  const TripsPopularCard({super.key, this.trip});
  final PopularTripModel? trip;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        if (trip!.id != null) {
          NavigateToPage.slideFromRight(
              context: context, page: TripPage(id: trip!.id));
        }
      },
      child: Container(
        height: AppSizes.getHeight(143, context),
        width: AppSizes.getWidth(225, context),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Positioned.fill(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: checkIMg(),
                fit: BoxFit.fill,
                errorListener: (value) {
                  log(value.toString());
                },
                placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: pKcolor.withOpacity(0.2),
                    child: Container(
                      width: double.infinity,
                      height: AppSizes.getHeight(150, context),
                      color: Colors.white,
                    )), // Placeholder widget
                errorWidget: (context, url, error) {
                  log(error.toString());
                  log(url);
                  return const Icon(Icons.error, color: pKcolor);
                },
              ),
            )),
            // const Positioned(top: 14, right: 14, child: TripsFavIcon()),
            Positioned(
                right: 14,
                left: 14,
                bottom: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: AppSizes.getWidth(80, context),
                          child: Text(trip!.name ?? "",
                              style: AppStyles.styleSemiBold12(context)
                                  .copyWith(color: Colors.white)),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on_sharp,
                                color: Colors.white, size: 10),
                            const Gap(2),
                            Text(
                              trip?.destination ?? "",
                              style: AppStyles.styleRegular10(context)
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text("${trip?.price} ${trip?.currency}",
                            style: AppStyles.styleBold12(context)
                                .copyWith(color: Colors.white)),
                        const Gap(4),
                        Text(S.of(context).PerPerson,
                            style: AppStyles.styleMedium10(context)
                                .copyWith(color: Colors.white)),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  String checkIMg() {
    String img =
        "https://yallanowofficiall.runasp.net/images/817e6b12-9852-40c4-ae7b-4fd472644877-IMG_1623.jpeg";
    String errimg =
        " http://yallanowofficiall.runasp.net/images/d87b7a62-5368-4bc8-930a-e7d810007445-hr.jpg";
    String secerrimg =
        "http://yallanowofficiall.runasp.net/images/d87b7a62-5368-4bc8-930a-e7d810007445-hr.jpg";
    String thirderrimg =
        "http://yallanowofficiall.runasp.net/images/a75b66b8-42db-45f9-9e32-ff112654cf9f-IMG_1361.jpeg";
    if (trip?.imageUrl == errimg ||
        trip?.imageUrl == secerrimg ||
        trip?.imageUrl == thirderrimg ||
        trip?.imageUrl == null) {
      return img;
    } else {
      return trip!.imageUrl!;
    }
  }
}
