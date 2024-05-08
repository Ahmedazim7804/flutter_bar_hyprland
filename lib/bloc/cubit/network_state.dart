part of 'network_cubit.dart';

@immutable
sealed class NetworkState {}

final class NetworkDisabled extends NetworkState {}

final class NetworkDisconnecting extends NetworkState {}

final class NetworkConnecting extends NetworkState {}

final class NetworkDisconnected extends NetworkState {}

final class NetworkWifiConnected extends NetworkState {
  NetworkWifiConnected({required this.networkInfo});

  final NetworkInfo networkInfo;
}

final class NetworkEthernetConnected extends NetworkState {
  NetworkEthernetConnected({required this.networkInfo});

  final NetworkInfo networkInfo;
}
