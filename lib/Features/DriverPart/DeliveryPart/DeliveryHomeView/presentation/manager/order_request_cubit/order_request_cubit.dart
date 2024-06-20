import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_request_state.dart';

class OrderRequestCubit extends Cubit<OrderRequestState> {
  OrderRequestCubit() : super(OrderRequestInitial());
}
