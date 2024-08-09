import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketItemPageBody.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ItemPageBottomBar.dart';

class MarketItemPage extends StatelessWidget {
  const MarketItemPage({super.key, required this.item});
  final MartItem item;
  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<BasketManagerCubit>(context).sizeSelected = true;

    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: MarketItemPageBody(item: item),
        bottomNavigationBar: ItemPageBottomBar(itemId: item.id));
  }
}
