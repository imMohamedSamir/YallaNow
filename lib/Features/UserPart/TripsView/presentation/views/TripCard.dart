import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripPage.dart';
import 'package:yallanow/generated/l10n.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key, this.trip});
  final TripCardModel? trip;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        NavigateToPage.slideFromRight(
            context: context, page: TripPage(id: trip!.id));
      },
      child: Container(
        padding: EdgeInsets.zero,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppSizes.getWidth(115, context),
              height: AppSizes.getHeight(84, context),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: checkIMg(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip?.name ?? "",
                      style: AppStyles.styleBold18(context)
                          .copyWith(fontSize: 14, color: blackdcolor),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_sharp, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          trip?.destniation ?? "",
                          style: AppStyles.styleMedium12(context)
                              .copyWith(color: scColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      trip?.description ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppStyles.styleRegular10(context),
                    ),
                    const SizedBox(height: 1),
                    Row(
                      children: [
                        Text(
                          "${trip?.price} ${trip?.currency}",
                          style: AppStyles.styleSemiBold14(context)
                              .copyWith(color: blackdcolor),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          S.of(context).PerPerson,
                          style: AppStyles.styleRegular12(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
