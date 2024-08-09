import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/PharmacyItem.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyCategoryGVSec.dart';

class PharmacyCategoryPage extends StatelessWidget {
  const PharmacyCategoryPage(
      {super.key, required this.title, required this.items});
  final String title;
  final List<PharmacyItem> items;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemPageCubit(),
      child: Scaffold(
        appBar: categoryAppBar(context, title: title, isCategory: false),
        body: PharmacyCategoryPageBody(title: title, items: items),
      ),
    );
  }
}

class PharmacyCategoryPageBody extends StatelessWidget {
  const PharmacyCategoryPageBody({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<PharmacyItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: PharmacyCategoryGVSec(
            title: title,
            items: items,
          )),
        ],
      ),
    );
  }
}
