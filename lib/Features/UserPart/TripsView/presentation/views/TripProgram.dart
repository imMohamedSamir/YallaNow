import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/generated/l10n.dart';

class TripProgram extends StatelessWidget {
  const TripProgram({super.key, required this.program});
  final String program;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).Program,
              style: AppStyles.styleSemiBold18(context)),
          const Gap(6),
          DescriptionText(
            program: program,
          )
        ],
      ),
    );
  }
}

class DescriptionText extends StatefulWidget {
  final String program;

  const DescriptionText({Key? key, required this.program}) : super(key: key);

  @override
  _DescriptionTextState createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 650),
          curve: Curves.decelerate,
          child: Text(
            widget.program,
            maxLines: _isExpanded ? null : 3,
            overflow: _isExpanded ? TextOverflow.visible : TextOverflow.fade,
            style: AppStyles.styleRegular16(context).copyWith(color: scColor),
          ),
        ),
        if (checkLength() && !_isExpanded)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = true;
              });
            },
            child: Text(
              "Read more...",
              style: AppStyles.styleRegular16(context).copyWith(color: pKcolor),
            ),
          ),
        if (_isExpanded)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              "Read less...",
              style: AppStyles.styleRegular16(context).copyWith(color: pKcolor),
            ),
          ),
      ],
    );
  }

  bool checkLength() {
    return widget.program.split(" ").length > 25;
  }
}
