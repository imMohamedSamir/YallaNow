import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:signalr_netcore/signalr_client.dart';

part 'scooter_request_state.dart';

class ScooterRequestCubit extends Cubit<ScooterRequestState> {
  ScooterRequestCubit() : super(ScooterRequestInitial());
  final HubConnection _connection = HubConnectionBuilder()
      .withUrl("https://yallanow.runasp.net/api/")
      .build();
  void connect() async {
    await _connection.start();

    _connection.on('ReceiveRideOffer', (message) {});
  }

  void sendRequest(String message) async {
    await _connection.invoke('sendRequest', args: [message]);
  }

  @override
  Future<void> close() async {
    await _connection.stop();
    return super.close();
  }
}
