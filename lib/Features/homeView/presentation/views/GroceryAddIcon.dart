import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class GroceryAddIcon extends StatefulWidget {
  const GroceryAddIcon({super.key});

  @override
  State<GroceryAddIcon> createState() => _GroceryAddIconState();
}

class _GroceryAddIconState extends State<GroceryAddIcon> {
  bool active = false;
  int number = 0;
  void _onTap() {
    setState(() {
      active = !active;
      if (active) {
        number += 1;
      }
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // duration: const Duration(milliseconds: 30),
          width: active ? 130 : 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: active ? Colors.white : const Color(0xffB20404),
          ),
          child: Center(
              child: active
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: const Color(0xffB20404),
                              shape: BoxShape.circle),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.remove, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                if (number > 0) {
                                  number -= 1;
                                }
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 14),
                        Text(number.toString(),
                            style: AppStyles.styleBold18(context)),
                        SizedBox(width: 14),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: const Color(0xffB20404),
                              shape: BoxShape.circle),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                number += 1;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 14),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: const Color(0xffB20404),
                              shape: BoxShape.circle),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                active = !active;
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  : null),
        ),
        Positioned.fill(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: active ? 0.0 : 1.0,
            child: Center(
                child: number > 0
                    ? GestureDetector(
                        onTap: () {
                          active = !active;
                          setState(() {});
                        },
                        child: Text(
                          number.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    : IconButton(
                        onPressed: _onTap,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      )),
          ),
        ),
      ],
    );
  }
}
