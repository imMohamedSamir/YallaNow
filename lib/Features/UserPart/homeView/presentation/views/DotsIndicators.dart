import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.isactiv});
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

class DotIndicatorgroup extends StatelessWidget {
  const DotIndicatorgroup(
      {super.key, required this.currentIndex, required this.length});
  final int currentIndex, length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          length,
          (index) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: DotIndicator(isactiv: index == currentIndex),
              )),
    );
  }
}
