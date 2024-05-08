import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_items_cubit/mart_items_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MartPageBody.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key, this.martName});
  final String? martName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: categoryAppBar(context, title: martName ?? ''),
      body: const MartPageBody(),
    );
  }
}
