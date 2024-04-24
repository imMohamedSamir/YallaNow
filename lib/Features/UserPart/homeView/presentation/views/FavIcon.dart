import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({super.key, this.height, this.favorite});
  final double? height;
  final bool? favorite;
  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  late bool active;

  @override
  void initState() {
    super.initState();
    active = widget.favorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.height ??
          AppSizes.getWidth(24, context), // Adjust width and height as needed
      height: widget.height ?? AppSizes.getHeight(24, context),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white, // Background color of the icon
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          active == true ? Icons.favorite : Icons.favorite_border_outlined,
          color: active == true
              ? const Color(0xffB20404)
              : const Color(0xff5A5A5A),
          size: 20,
        ),
        onPressed: () {
          active = !active;
          setState(() {});
        },
      ),
    );
  }
}
