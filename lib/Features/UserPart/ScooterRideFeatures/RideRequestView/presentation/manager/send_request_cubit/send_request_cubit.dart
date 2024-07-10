import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/Repos/ScooterRequestRepo.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/user_request_model.dart';

part 'send_request_state.dart';

class SendRequestCubit extends Cubit<SendRequestState> {
  SendRequestCubit(this.scooterRequestRepo) : super(SendRequestInitial());
  final ScooterRequestRepo scooterRequestRepo;
  UserRequestModel requestModel = UserRequestModel();
  void send() async {
    emit(SendRequestLoading());
    var result = await scooterRequestRepo.sendRequest(request: requestModel);
    result.fold((fail) => emit(SendRequestFailure(errMsg: fail.errMessage)),
        (r) => emit(SendRequestSuccess(requestModel: requestModel)));
  }

  void setInitial() {
    emit(SendRequestInitial());
  }
}
