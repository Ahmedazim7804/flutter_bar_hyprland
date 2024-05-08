part of 'bluetooth_cubit.dart';

@immutable
sealed class BluetoothState {}

final class BluetoothDisabled extends BluetoothState {}

final class BluetoothConnected extends BluetoothState {
  BluetoothConnected({required this.name});
  final String name;
}

final class BluetoothConnecting extends BluetoothState {}

final class BluetoothDisconnected extends BluetoothState {}
