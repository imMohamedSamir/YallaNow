import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/FavIcon.dart';

class ResturantImgContainer extends StatelessWidget {
  const ResturantImgContainer({
    super.key,
    required this.img,
  });
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 4, top: 4),
        width: AppSizes.getWidth(128, context),
        height: AppSizes.getHeight(103, context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey,
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.fill,
          ),
        ),
        child: const Align(alignment: Alignment.topRight, child: FavIcon()));
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
