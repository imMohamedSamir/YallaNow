import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_details_cubit.dart/trip_details_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_page_cubit/trip_page_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantHeaderIcon.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/FavIcon.dart';

class TripAppBar extends StatelessWidget {
  const TripAppBar({super.key});
// CachedNetworkImage(
//                     imageUrl: resturantImg!,
//                     placeholder: (context, url) => Shimmer.fromColors(
//                         baseColor: Colors.white,
//                         highlightColor: pKcolor.withOpacity(0.2),
//                         child: Container(
//                           width: double.infinity,
//                           height: AppSizes.getHeight(150, context),
//                           color: Colors.white,
//                         )),
//                     fit: BoxFit.fill),
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 0),
      sliver: BlocBuilder<TripPageCubit, TripPageState>(
        builder: (context, state) {
          if (state is TripPageScrolled) {
            bool istop = state.isTop;
            return SliverAppBar(
              backgroundColor: Colors.white,
              floating: false,
              titleSpacing: -4,
              pinned: true,
              expandedHeight: AppSizes.getHeight(150, context),
              flexibleSpace: const FlexibleSpaceBar(
                background: TripImg(),
              ),
              leading: istop
                  ? FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        width: AppSizes.getWidth(32, context),
                        height: AppSizes.getHeight(32, context),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            iconSize: 18,
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: istop ? Colors.white : null,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
              title: istop
                  ? null
                  : BlocBuilder<TripDetailsCubit, TripDetailsState>(
                      builder: (context, state) {
                        String title = state is TripDetailsSuccess
                            ? state.trip.name ?? ""
                            : "";
                        return Text(title,
                            style: AppStyles.styleMedium18(context)
                                .copyWith(color: blackdcolor));
                      },
                    ),
              // actions: [
              //   FavIcon(height: AppSizes.getHeight(32, context)),
              //   const SizedBox(width: 10),
              //   ResturantHeaderIcon(
              //     child: SvgPicture.asset(Assets.imagesShareIcon),
              //     onPressed: () {},
              //   ),
              //   const SizedBox(width: 10),
              //   ResturantHeaderIcon(
              //     child: SvgPicture.asset(
              //       Assets.imagesSearchIcon,
              //       colorFilter: const ColorFilter.mode(
              //           Color(0xff240301), BlendMode.srcIn),
              //     ),
              //     onPressed: () {},
              //   ),
              //   const SizedBox(width: 16)
              // ],
            );
          } else {
            return SliverAppBar(
              backgroundColor: Colors.white,

              titleSpacing: -4,
              pinned: true,
              expandedHeight: AppSizes.getHeight(150, context),
              flexibleSpace: const FlexibleSpaceBar(
                background: TripImg(),
              ),
              leading: FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  width: AppSizes.getWidth(32, context),
                  height: AppSizes.getHeight(32, context),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      iconSize: 18,
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
              // actions: [
              //   FavIcon(height: AppSizes.getHeight(32, context)),
              //   const SizedBox(width: 10),
              //   ResturantHeaderIcon(
              //     child: SvgPicture.asset(Assets.imagesShareIcon),
              //     onPressed: () {},
              //   ),
              //   const SizedBox(width: 10),
              //   ResturantHeaderIcon(
              //     child: SvgPicture.asset(
              //       Assets.imagesSearchIcon,
              //       colorFilter: const ColorFilter.mode(
              //           Color(0xff240301), BlendMode.srcIn),
              //     ),
              //     onPressed: () {},
              //   ),
              //   const SizedBox(width: 16)
              // ],
            );
          }
        },
      ),
    );
  }
}

class TripImg extends StatelessWidget {
  const TripImg({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripDetailsCubit, TripDetailsState>(
      builder: (context, state) {
        if (state is TripDetailsSuccess) {
          String img = state.trip.imageUrl ?? "";
          return CachedNetworkImage(
              imageUrl: img,
              placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: pKcolor.withOpacity(0.2),
                  child: Container(
                    width: double.infinity,
                    height: AppSizes.getHeight(150, context),
                    color: Colors.white,
                  )),
              errorWidget: (context, url, error) {
                return const Icon(Icons.error);
              },
              fit: BoxFit.fill);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
