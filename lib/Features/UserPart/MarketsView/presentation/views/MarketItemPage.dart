import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketItemAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketRelatedProductsSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartItemDescription.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ItemPageBottomBar.dart';

class MarketItemPage extends StatelessWidget {
  const MarketItemPage({super.key, required this.item});
  final MartItem item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MarketItemAppBar(img: item.imageUrl!),
              MartItemDescription(item: item),
              const SizedBox(height: 10),
              const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: MarketRelatedProductsSec())
            ],
          ),
        ),
        bottomNavigationBar: const ItemPageBottomBar());
  }
}
