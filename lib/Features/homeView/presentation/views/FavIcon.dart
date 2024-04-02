import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';

class favIcon extends StatefulWidget {
  const favIcon({super.key, this.height, this.favorite});
  final double? height;
  final bool? favorite;
  @override
  State<favIcon> createState() => _favIconState();
}

class _favIconState extends State<favIcon> {
  late bool active;

  @override
  void initState() {
    super.initState();
    active = widget.favorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
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
      ),
    );
  }
}
