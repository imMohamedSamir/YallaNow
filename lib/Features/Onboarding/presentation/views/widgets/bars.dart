import 'package:flutter/material.dart';

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
        color: isctive ? const Color(0xffB20404) : const Color(0xff9E9D9D),
      ),
    );
  }
}
