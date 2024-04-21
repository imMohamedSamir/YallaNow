import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manage_basket_state.dart';

class ManageBasketCubit extends Cubit<ManageBasketState> {
  ManageBasketCubit() : super(ManageBasketInitial());
}
