import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketItemAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketRelatedProductsSec.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartItemDescription.dart';

class MarketItemPageBody extends StatelessWidget {
  const MarketItemPageBody({super.key, required this.item});

  final MartItem item;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ItemPageCubit>(context).createItem(
        itemsModel: SelectedItemsModel(
            itemID: item.id,
            partnerType: 1,
            partnerID: "",
            name: item.name!,
            price: item.price.toString(),
            img: item.imageUrl!));
    return SingleChildScrollView(
      child: Column(
        children: [
          MarketItemAppBar(img: item.imageUrl!),
          MartItemDescription(item: item),
          const SizedBox(height: 10),
          // const Padding(
          //     padding: EdgeInsets.only(left: 16),
          //     child: MarketRelatedProductsSec())
        ],
      ),
    );
  }
}
