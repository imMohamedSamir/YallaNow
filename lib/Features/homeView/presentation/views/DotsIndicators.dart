import 'package:flutter/material.dart';

class dotIndicator extends StatelessWidget {
  const dotIndicator({super.key, required this.isactiv});
  final bool isactiv;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 8,
      duration: const Duration(milliseconds: 250),
      width: isactiv ? 32 : 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isactiv ? const Color(0xffB20404) : const Color(0xff9E9D9D)),
    );
  }
}

class dotIndicatorgroup extends StatelessWidget {
  const dotIndicatorgroup({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          4,
          (index) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: dotIndicator(isactiv: index == currentIndex),
              )),
    );
  }
}
