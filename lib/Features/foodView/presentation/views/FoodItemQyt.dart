import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/foodView/presentation/views/QytIconButton.dart';

class FoodItemQyt extends StatefulWidget {
  const FoodItemQyt({super.key, this.currentnumber});
  final int? currentnumber;
  @override
  State<FoodItemQyt> createState() => _FoodItemQytState();
}

class _FoodItemQytState extends State<FoodItemQyt> {
  int number = 1;
  void quantityMethod() {
    if (widget.currentnumber != null) {
      number = widget.currentnumber!;
    }
  }

  @override
  void initState() {
    quantityMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QytIconButton(
          icon: Icons.remove,
          color: number == 1
              ? const Color(0xffB20404).withOpacity(0.1)
              : const Color(0xffB20404),
          onTap: () {
            if (number > 1) {
              number--;
              setState(() {});
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            number.toString(),
            style: AppStyles.styleBold18(context)
                .copyWith(color: const Color(0xff240301)),
          ),
        ),
        QytIconButton(
          icon: Icons.add,
          color: const Color(0xffB20404),
          onTap: () {
            number++;
            setState(() {});
          },
        ),
      ],
    );
  }
}
