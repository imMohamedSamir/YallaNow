import 'package:flutter/material.dart';

class favIcon extends StatefulWidget {
  const favIcon({super.key});

  @override
  State<favIcon> createState() => _favIconState();
}

class _favIconState extends State<favIcon> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 24, // Adjust width and height as needed
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200], // Background color of the icon
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
