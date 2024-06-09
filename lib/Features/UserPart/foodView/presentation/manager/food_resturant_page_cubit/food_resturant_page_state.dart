part of 'food_resturant_page_cubit.dart';

sealed class FoodResturantPageState extends Equatable {
  const FoodResturantPageState();

  @override
  List<Object> get props => [];
}

final class FoodResturantPageInitial extends FoodResturantPageState {}

final class FoodResturantPageChange extends FoodResturantPageState {}

final class FoodResturantPageScroll extends FoodResturantPageState {
  final bool isTop;

  const FoodResturantPageScroll({required this.isTop});
}
