import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class FilterListCard extends StatefulWidget {
  const FilterListCard({
    super.key,
    required this.filterType,
  });
  final String filterType;

  @override
  State<FilterListCard> createState() => _FilterListCardState();
}

class _FilterListCardState extends State<FilterListCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 450),
        padding:
            const EdgeInsets.only(top: 4.0, right: 12, left: 16, bottom: 6),
        decoration: BoxDecoration(
            color: isSelected ? pKcolor : null,
            borderRadius: BorderRadius.circular(16),
            border: isSelected ? null : Border.all(color: scColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(widget.filterType,
                style: AppStyles.styleRegular14(context)
                    .copyWith(color: isSelected ? null : scColor)),
            const SizedBox(width: 10),
            isSelected
                ? const Icon(Icons.close, size: 16, color: Colors.white)
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class FilterListMainCard extends StatelessWidget {
  const FilterListMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: AppSizes.getHeight(32, context),
        width: AppSizes.getWidth(136, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: scColor)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 7.0, right: 6, left: 16, bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.imagesArrows),
              const SizedBox(width: 10),
              Text(
                "Sort by",
                style:
                    AppStyles.styleRegular14(context).copyWith(color: scColor),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.keyboard_arrow_down_outlined,
                  size: 20, color: scColor)
            ],
          ),
        ),
      ),
    );
  }
}
