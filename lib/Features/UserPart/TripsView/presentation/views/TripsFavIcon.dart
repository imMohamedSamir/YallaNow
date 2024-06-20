import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class TripsFavIcon extends StatefulWidget {
  const TripsFavIcon({super.key, this.favorite});
  final bool? favorite;
  @override
  State<TripsFavIcon> createState() => _TripsFavIconState();
}

class _TripsFavIconState extends State<TripsFavIcon> {
  late bool active;

  @override
  void initState() {
    super.initState();
    active = widget.favorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        setState(() {
          active = !active;
        });
      },
      child: Container(
        width:
            AppSizes.getWidth(24, context), // Adjust width and height as needed
        height: AppSizes.getHeight(24, context),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white, // Background color of the icon
        ),
        child: Icon(
          active == true ? Icons.favorite : Icons.favorite_border_outlined,
          color: active == true ? pKcolor : const Color(0xff5A5A5A),
          size: 18,
        ),
      ),
    );
  }
}
