import 'package:flutter/material.dart';

class OffresPageView extends StatelessWidget {
  const OffresPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: List.generate(
            4,
            (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffB20404),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                )),
      ),
    );
  }
}
