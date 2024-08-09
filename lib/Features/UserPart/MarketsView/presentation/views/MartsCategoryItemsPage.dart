import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/mart_details_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartsCategoryItemsPageBody.dart';

class MartsCategoryItemsPage extends StatelessWidget {
  const MartsCategoryItemsPage({super.key, required this.categ});
  final MartDetailsModel categ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: categoryAppBar(context, title: categ.name ?? ""),
      body: MartsCategoryItemsPageBody(categ: categ),
    );
  }
}
