import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'food_resturant_page_state.dart';

class FoodResturantPageCubit extends Cubit<FoodResturantPageState> {
  FoodResturantPageCubit() : super(FoodResturantPageInitial());
  final ScrollController scrollController = ScrollController();
  void scrollUpdate() {
    scrollController.addListener(() {
      bool isTop = scrollController.offset <= kToolbarHeight + 10;
      emit(FoodResturantPageInitial());
      emit(FoodResturantPageScroll(isTop: isTop));
    });
  }
}
