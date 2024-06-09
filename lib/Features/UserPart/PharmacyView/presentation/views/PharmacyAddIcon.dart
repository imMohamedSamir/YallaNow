import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/PharmacyItem.dart';

class PharmacyAddIcon extends StatefulWidget {
  const PharmacyAddIcon({super.key, this.item});
  final PharmacyItem? item;

  @override
  State<PharmacyAddIcon> createState() => PharmacyAddIconState();
}

class PharmacyAddIconState extends State<PharmacyAddIcon> {
  bool active = false;
  int number = 0;
  late PharmacyItem pharmacyitem;
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 1), () {});
    pharmacyitem = widget.item!;

    super.initState();
  }

  void _startTimer() {
    _timer.cancel();
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        active = false;
        // number = 0;
      });
    });
  }

  void addtoBasket() {
    SelectedItemsModel item = SelectedItemsModel(
        itemID: pharmacyitem.id,
        name: pharmacyitem.name ?? '',
        quantity: '1',
        price: pharmacyitem.price.toString(),
        img: pharmacyitem.imageUrl!);
    BlocProvider.of<ItemPageCubit>(context)
        .createItem(itemsModel: item, isMart: true);
    BlocProvider.of<ItemPageCubit>(context)
        .addToBasket(itemID: pharmacyitem.id!);
    BlocProvider.of<BasketManagerCubit>(context).getBasketItems();
  }

  void changeqty({bool add = false}) {
    BlocProvider.of<ItemPageCubit>(context)
        .changeQty(itemID: pharmacyitem.id!, number: number, add: add);
    BlocProvider.of<BasketManagerCubit>(context).getBasketItems(isMart: true);
  }

  void _onTap() {
    setState(() {
      active = !active;
      _startTimer();
      if (active) {
        number += 1;
        addtoBasket();
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
    return Stack(
      children: [
        Container(
          width: active ? 135 : 35,
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
                        const SizedBox(width: 14),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                              color: Color(0xffB20404), shape: BoxShape.circle),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.remove, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                if (number > 0) {
                                  number -= 1;
                                  changeqty(add: false);
                                  _startTimer();
                                }
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 14),
                        Text(number.toString(),
                            style: AppStyles.styleBold18(context)),
                        const SizedBox(width: 14),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                              color: Color(0xffB20404), shape: BoxShape.circle),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: () {
                              setState(() {
                                number += 1;
                                changeqty(add: true);
                                _startTimer();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 14),
                      ],
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
