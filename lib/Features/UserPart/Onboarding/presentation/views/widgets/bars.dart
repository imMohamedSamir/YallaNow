import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class bars extends StatelessWidget {
  const bars({super.key, required this.currentpage});
  final int currentpage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          4,
          (index) => Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? 16 : 0, right: index == 3 ? 16 : 8),
                child: OBbar(isctive: index == currentpage),
              )),
    );
  }
}

class OBbar extends StatelessWidget {
  const OBbar({
    super.key,
    required this.isctive,
  });
  final bool isctive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      width: 84,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isctive ? pKcolor : Colors.white,
      ),
    );
  }
}
