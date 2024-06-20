import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/add_fav_model.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/FavIcon.dart';

class ResturantImgContainer extends StatelessWidget {
  const ResturantImgContainer({
    super.key,
    required this.img,
    required this.id,
  });
  final String img, id;
  AddFavModel createAddFavModel(String id) {
    return AddFavModel(partnerId: id, partnerType: 2);
  }

  @override
  Widget build(BuildContext context) {
    AddFavModel model = createAddFavModel(id);
    return Container(
        padding: const EdgeInsets.only(right: 4, top: 4),
        width: AppSizes.getWidth(128, context),
        height: AppSizes.getHeight(103, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey,
          image: DecorationImage(
            image: img.contains('wwwroot')
                ? const AssetImage(Assets.imagesSupermarket1) as ImageProvider
                : NetworkImage(img),
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
            alignment: Alignment.topRight, child: FavIcon(addFavModel: model)));
  }
}

class MartImgContainer extends StatelessWidget {
  const MartImgContainer({
    super.key,
    required this.img,
    required this.id,
  });
  final String img, id;
  AddFavModel createAddFavModel(String id) {
    return AddFavModel(partnerId: id, partnerType: 1);
  }

  @override
  Widget build(BuildContext context) {
    AddFavModel model = createAddFavModel(id);
    return Container(
        padding: const EdgeInsets.only(right: 4, top: 4),
        width: AppSizes.getWidth(128, context),
        height: AppSizes.getHeight(103, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey,
          image: DecorationImage(
            image: img.contains('wwwroot')
                ? const AssetImage(Assets.imagesSupermarket1) as ImageProvider
                : NetworkImage(img),
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
            alignment: Alignment.topRight, child: FavIcon(addFavModel: model)));
  }
}

class RestFoodImgContainer extends StatelessWidget {
  const RestFoodImgContainer({
    super.key,
    required this.hieght,
    required this.img,
    required this.width,
  });
  final String img;
  final double hieght;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 4, top: 4),
        width: width,
        height: hieght * 0.50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey,
          image: DecorationImage(
            alignment: Alignment.center,
            image: AssetImage(img),
            fit: BoxFit.cover,
          ),
        ),
        child: const Align(alignment: Alignment.topRight, child: FavIcon()));
  }
}
