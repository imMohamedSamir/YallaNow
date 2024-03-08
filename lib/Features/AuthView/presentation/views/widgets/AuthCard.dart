import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(width: 1.7, color: Color(0xffEEEEEE))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        child: SvgPicture.asset(image),
      ),
    );
  }
}
