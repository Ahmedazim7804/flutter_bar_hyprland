import 'package:bar/models/network_model.dart';
import 'package:bar/streams/network_stream.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final NetworkStream networkStream = NetworkStream();

  NetworkCubit() : super(NetworkDisabled()) {
    networkStream.getNetworkInfo().then((ni) => stateEmitter(ni));

    listen();
  }

  void stateEmitter(NetworkInfo ni) {
    if (ni.state == NS.STATE_ASLEEP) {
      emit(NetworkDisconnected());
    } else if (ni.state == NS.STATE_CONNECTED_GLOBAL ||
        ni.state == NS.STATE_CONNECTED_LOCAL ||
        ni.state == NS.STATE_CONNECTED_SITE) {
      if (ni.primaryConnectionIsWifi) {
        emit(NetworkWifiConnected(networkInfo: ni));
      } else {
        emit(NetworkEthernetConnected(networkInfo: ni));
      }
    } else if (ni.state == NS.STATE_CONNECTING) {
      emit(NetworkConnecting());
    } else if (ni.state == NS.STATE_DISCONNECTED) {
      emit(NetworkDisconnected());
    } else if (ni.state == NS.STATE_DISCONNECTING) {
      emit(NetworkDisconnecting());
    } else {
      emit(NetworkDisabled());
    }
  }

  void listen() {
    networkStream.eventListener.stream.listen((ni) {
      stateEmitter(ni);
    });
  }
}
