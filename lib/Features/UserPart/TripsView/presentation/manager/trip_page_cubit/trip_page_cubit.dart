import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'trip_page_state.dart';

class TripPageCubit extends Cubit<TripPageState> {
  TripPageCubit() : super(TripPageInitial());
  final ScrollController scrollController = ScrollController();
  void scrollUpdate() {
    scrollController.addListener(() {
      bool isTop = scrollController.offset <= kToolbarHeight + 5;
      emit(TripPageInitial());
      emit(TripPageScrolled(isTop: isTop));
    });
  }
}
