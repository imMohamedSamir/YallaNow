import 'package:flutter/material.dart';
import 'package:yallanow/Features/homeView/presentation/views/FavIcon.dart';

class ResturantImgContainer extends StatelessWidget {
  const ResturantImgContainer({
    super.key,
    required this.hieght,
    required this.img,
  });
  final String img;
  final double hieght;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 4, top: 4),
        width: hieght * 0.60,
        height: hieght * 0.50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey,
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.fill,
          ),
        ),
        child: const favIcon());
  }
}
