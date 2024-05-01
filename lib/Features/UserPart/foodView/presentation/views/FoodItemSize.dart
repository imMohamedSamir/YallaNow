import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ExtarType.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/SizeType.dart';

class FoodItemDetails extends StatelessWidget {
  const FoodItemDetails(
      {super.key, required this.title, required this.iseRequired});
  final String title;
  final bool iseRequired;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(top: 24, left: 0, right: 16, bottom: 16),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 16),
              Text(title,
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: const Color(0xff240301))),
              const Spacer(),
              Container(
                width: width * 0.1999,
                height: height * 0.0278,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: ShapeDecoration(
                  color: iseRequired
                      ? const Color(0xFFFFD8CF)
                      : const Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(iseRequired ? 'Required' : 'Optional',
                    style: AppStyles.styleMedium10(context).copyWith(
                        color: iseRequired ? null : const Color(0xff5A5A5A))),
              ),
            ],
          ),
          const SizedBox(height: 16),
          iseRequired ? const SizeType() : const ExtarType(),
        ],
      ),
    );
  }
}
