import 'dart:async';
import 'dart:ffi';

import 'package:bar/dbus/bluetooth_dbus.dart';
import 'package:bar/models/bluetooth_model.dart';
import 'package:bluez/bluez.dart';
import 'package:dbus/dbus.dart';
import 'package:async/async.dart';
import 'dart:async';

class BluetoothStream {
  final client = DBusClient.system();
  late final OrgBluez object;
  final StreamController<BluetoothService> bluetoothService =
      StreamController<BluetoothService>();

  BluetoothStream() {
    object = OrgBluez(client, 'org.bluez', path: DBusObjectPath('/'));
    _startBluetoothServiceStream();
  }

  Future<void> _getInitialState() async {
    await object.intialize();

    bluetoothService.sink.add(BluetoothService(
        connectedDevices: object.connectedDevices,
        discovering: object.isBluetoothDiscovering,
        enabled: object.isBluetoothEnabled));
  }

  Future<void> _startBluetoothServiceStream() async {
    await _getInitialState();

    final streamGroup = StreamGroup.merge([
      object.bluetoothEnabled.stream,
      object.connectedDevicesStream.stream,
    ]);

    streamGroup.listen((event) {
      bluetoothService.sink.add(BluetoothService(
          connectedDevices: object.connectedDevices,
          discovering: object.isBluetoothDiscovering,
          enabled: object.isBluetoothEnabled));
    });
  }
}
