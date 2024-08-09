import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/functions/SavePartnerId.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketPage.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_details_cubit/pharmacy_details_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantPage.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/search_result_model.dart';

void goToResutlPage(BuildContext context,
    {required SearchResultModel resultModel, int? type}) {
  String imgurl = resultModel.imageUrl!.contains("wwwroot")
      ? "http://yallanow.runasp.net\\images\\c5840dc4-353d-4762-aa07-0bcd4e32c1f4_download.jpg"
      : resultModel.imageUrl!;
  if (resultModel.type == "Restaurant" || type == 2) {
    savePartnerId(id: resultModel.id!, type: 2);

    NavigateToPage.slideFromRight(
        context: context,
        page: FoodResturantPage(
            id: resultModel.id!,
            deliveryPrice: resultModel.deliveryFees.toString(),
            deliveryTime: resultModel.deliveryTime,
            resurantName: resultModel.name,
            returantImg: imgurl));
  } else if (resultModel.type == "Grocery") {
    NavigateToPage.slideFromRight(
        context: context,
        page: MarketPage(martName: resultModel.name!, martID: resultModel.id));
  } else {
    PharmacyModel pharmacyModel = PharmacyModel(
        id: resultModel.id,
        name: resultModel.name,
        describtion: resultModel.description,
        deliveryFees: resultModel.deliveryFees!.toDouble(),
        deliveryTime: resultModel.deliveryTime,
        rate: resultModel.rate,
        imgUrl: imgurl);
    BlocProvider.of<PharmacyDetailsCubit>(context)
        .getPharmacyDetails(context, pharmacyModel: pharmacyModel);
  }
}
