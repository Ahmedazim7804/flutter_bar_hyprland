import 'package:bar/models/bluetooth_model.dart';
import 'package:bar/streams/bluetooth_stream.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothState> {
  final BluetoothStream bluetoothStream = BluetoothStream();
  BluetoothCubit() : super(BluetoothDisabled()) {
    listenForStateChanges();
  }

  void listenForStateChanges() {
    bluetoothStream.bluetoothService.stream.listen((event) {
      if (event.enabled) {
        if (event.connectedDevices.isEmpty) {
          emit(BluetoothDisconnected());
        }

        final BluetoothDevice device = event.connectedDevices.first;

        if (device.servicesResolved) {
          emit(BluetoothConnected(name: device.name));
        } else {
          emit(BluetoothConnecting());
        }
      }

      emit(BluetoothDisabled());
    });
  }
}
