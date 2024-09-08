import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yallanow/Core/utlis/FirebaseMessagingService.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/data/Repo/DeliveryRequestRepo.dart';

part 'delivery_request_state.dart';

class DeliveryRequestCubit extends Cubit<DeliveryRequestState> {
  DeliveryRequestCubit(this.messagingService, this._deliveryRequestRepo)
      : super(DeliveryRequestInitial());
  final FirebaseMessagingService messagingService;
  final DeliveryRequestRepo _deliveryRequestRepo;
  bool _isJoined = false;
  void checkLocationPermission() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      emit(DeliveryRequestDisabled());
      return;
    }
    Geolocator.getServiceStatusStream().listen((ServiceStatus status) async {
      if (status == ServiceStatus.disabled) {
        emit(DeliveryRequestDisabled());
      } else {
        emit(DeliveryRequestInitial());
      }
    });
  }

  Future<void> toggleJoin() async {
    if (!_isJoined) {
      await connect();
      _isJoined = true;
    } else {
      await disconnect();
      _isJoined = false;
      emit(DeliveryRequestInitial());
    }
  }

  Future<void> initialize() async {
    var result = await messagingService.init();
    result.fold((l) => emit(DeliveryRequestFailure()), (r) => null);
  }

  Future<void> connect() async {
    emit(DeliveryRequestLoading());
    await messagingService.connect();
    emit(DeliveryRequestConnected());
  }

  Future<void> disconnect() async {
    emit(DeliveryRequestLoading());
    await _deliveryRequestRepo.disconnect();
    emit(DeliveryRequestInitial());
    _isJoined = false;
  }
}
