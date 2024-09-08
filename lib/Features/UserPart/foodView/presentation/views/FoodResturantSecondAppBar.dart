import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/ResturantDetailsCubit/ResturantDetailsCubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/food_resturant_page_cubit/food_resturant_page_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantHeaderIcon.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/FavIcon.dart';

class FoodResturantSecondAppBar extends StatelessWidget {
  const FoodResturantSecondAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 16),
      sliver: BlocBuilder<ResturantDetailsCubit, ResturantDetailsesState>(
        builder: (context, state) {
          bool isLoading = state is ResturantDetailsLoading;
          String resturantImg = "", resturantName = "";
          final String partnerId;
          if (state is ResturantDetailsSuccess) {
            resturantName = state.branchDetails.branchName ?? "";
            resturantImg = state.branchDetails.branchImageUrl ?? "";
            partnerId = state.branchDetails.branchId ?? "";
          }
          return BlocBuilder<FoodResturantPageCubit, FoodResturantPageState>(
            builder: (context, state) {
              bool isTop =
                  state is FoodResturantPageScroll ? state.isTop : false;
              return SliverAppBar(
                floating: true,
                titleSpacing: -4,
                pinned: true,
                expandedHeight: AppSizes.getHeight(150, context),
                flexibleSpace: _buildFlexibleSpaceBar(context,
                    resturantImg: resturantImg, isLoading: isLoading),
                leading: _buildLeadingIcon(context, isTop: isTop),
                title: _buildTitle(context,
                    isTop: isTop, resturantName: resturantName),
                actions: _buildActions(context),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildFlexibleSpaceBar(BuildContext context,
      {required String resturantImg, bool isLoading = false}) {
    return FlexibleSpaceBar(
      background: isLoading
          ? const LoadingImg()
          : CachedNetworkImage(
              imageUrl: resturantImg,
              placeholder: (context, url) => const LoadingImg(),
              fit: BoxFit.fill,
            ),
    );
  }

  Widget _buildLeadingIcon(BuildContext context, {bool isTop = false}) {
    return FittedBox(
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
          },
        ),
      ),
    );
  }

  Widget? _buildTitle(BuildContext context,
      {required String resturantName, bool isTop = false}) {
    if (isTop) return null;
    return Text(
      resturantName,
      style: AppStyles.styleMedium18(context).copyWith(color: blackdcolor),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      FavIcon(
        height: AppSizes.getHeight(32, context),
        partnerId: partnerId,
      ),
      const SizedBox(width: 10),
      // Uncomment and implement these as needed
      // ResturantHeaderIcon(
      //   child: SvgPicture.asset(Assets.imagesShareIcon),
      //   onPressed: () {},
      // ),
      // const SizedBox(width: 10),
      // ResturantHeaderIcon(
      //   child: SvgPicture.asset(
      //     Assets.imagesSearchIcon,
      //     colorFilter: const ColorFilter.mode(
      //         Color(0xff240301), BlendMode.srcIn),
      //   ),
      //   onPressed: () {},
      // ),
      const SizedBox(width: 16),
    ];
  }
}

class LoadingImg extends StatelessWidget {
  const LoadingImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: pKcolor.withOpacity(0.2),
        child: Container(
          width: double.infinity,
          height: AppSizes.getHeight(150, context),
          color: Colors.white,
        ));
  }
}
