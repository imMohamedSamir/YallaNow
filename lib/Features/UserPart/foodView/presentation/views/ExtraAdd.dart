import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/extra.dart';

class ExtraAdd extends StatefulWidget {
  const ExtraAdd({super.key, required this.itemId, required this.extra});
  final String itemId;
  final Extra extra;
  @override
  State<ExtraAdd> createState() => _ExtraAddState();
}

class _ExtraAddState extends State<ExtraAdd> {
  bool active = false;
  int number = 0;
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 1), () {});
    super.initState();
  }

  void _startTimer() {
    _timer.cancel();
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        active = false;
      });
    });
  }

  void _onTap() {
    setState(() {
      active = !active;
      _startTimer();

      if (active) {
        number += 1;
        BlocProvider.of<ItemPageCubit>(context).chooseExtra(
            itemID: widget.itemId, quantity: number, itemExtra: widget.extra);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          active = !active;
          _startTimer();
        });
      },
      child: Stack(
        children: [
          Container(
            width: active ? 100 : 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: active ? Colors.white : const Color(0xffB20404),
            ),
            child: Center(
                child: active
                    ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 14),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: pKcolor,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (number > 0) {
                                      number -= 1;
                                      BlocProvider.of<ItemPageCubit>(context)
                                          .chooseExtra(
                                              itemID: widget.itemId,
                                              quantity: number,
                                              itemExtra: widget.extra,
                                              addExtra: false);
                                      _startTimer();
                                    }
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(number.toString(),
                                style: AppStyles.styleSemiBold16(context)
                                    .copyWith(color: pKcolor)),
                            const SizedBox(width: 12),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: pKcolor,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    number += 1;
                                    BlocProvider.of<ItemPageCubit>(context)
                                        .chooseExtra(
                                            itemID: widget.itemId,
                                            quantity: number,
                                            itemExtra: widget.extra);
                                    _startTimer();
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 14),
                          ],
                        ),
                      )
                    : null),
          ),
          Positioned.fill(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 350),
              opacity: active ? 0.0 : 1.0,
              child: Center(
                  child: number > 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              active = !active;
                              _startTimer();
                            });
                          },
                          child: Text(
                            number.toString(),
                            style: AppStyles.styleMedium14(context)
                                .copyWith(color: Colors.white),
                          ),
                        )
                      : IconButton(
                          padding: EdgeInsets.zero,
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
      ),
    );
  }
}
