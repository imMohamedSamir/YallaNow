import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/PharmacyItem.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyItemAppBar.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyItemDescription.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ItemPageBottomBar.dart';

class PharmacyItemPage extends StatelessWidget {
  const PharmacyItemPage({super.key, required this.item});
  final PharmacyItem item;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemPageCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: PharmacyItemPageBody(item: item),
        bottomNavigationBar: ItemPageBottomBar(itemId: item.id),
      ),
    );
  }
}

class PharmacyItemPageBody extends StatelessWidget {
  const PharmacyItemPageBody({
    super.key,
    required this.item,
  });

  final PharmacyItem item;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ItemPageCubit>(context).createItem(
        itemsModel: SelectedItemsModel(
            itemID: item.id,
            partnerType: 0,
            partnerID: "",
            name: item.name!,
            price: item.price.toString(),
            img: item.imageUrl!));
    return SingleChildScrollView(
      child: Column(
        children: [
          PharmacyItemAppBar(imgUrl: item.imageUrl!),
          PharmacyItemDescription(item: item),
          const SizedBox(height: 10),
          // const Padding(
          //     padding: EdgeInsets.only(left: 16),
          //     child: PharmacyRelatedProductsSec())
        ],
      ),
    );
  }
}
