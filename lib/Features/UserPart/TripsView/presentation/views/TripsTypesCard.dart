import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsTypeView.dart';

class TripsTypesCard extends StatelessWidget {
  const TripsTypesCard({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        NavigateToPage.slideFromRight(
            context: context, page: TripsTypeView(name: name));
      },
      child: Column(children: [
        // const TripsPlacesCardImg(),
        const SizedBox(height: 12),
        Container(
            padding: const EdgeInsets.all(26),
            decoration: BoxDecoration(
                color: pKcolor, borderRadius: BorderRadius.circular(16)),
            child: Center(
                child: Text(name,
                    style: AppStyles.styleMedium16(context)
                        .copyWith(color: Colors.white))))
      ]),
    );
  }
}
