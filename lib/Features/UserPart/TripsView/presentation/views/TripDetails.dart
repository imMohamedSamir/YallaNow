import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class TripDetails extends StatelessWidget {
  const TripDetails({super.key, required this.title, required this.details});
  final String title;
  final List<dynamic> details;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      width: AppSizes.getWidth(361, context),
      decoration: BoxDecoration(
          color: const Color(0xffD9E4EE),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                AppStyles.styleMedium18(context).copyWith(color: blackdcolor),
          ),
          const Gap(8),
          ...List.generate(
              details.length, (index) => TripDetailCard(title: details[index]))
        ],
      ),
    );
  }
}

class TripDetailCard extends StatelessWidget {
  const TripDetailCard({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          const Icon(Icons.circle, color: Colors.black, size: 16),
          const Gap(5),
          Flexible(
            child: Text(
              title,
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: blackdcolor),
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
