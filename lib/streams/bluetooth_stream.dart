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
  late final OrgBluez _orgBluezDbus;
  late final OrgBluezHCI0 _orgBluezHCI0;
  final StreamController<BluetoothService> bluetoothService =
      StreamController<BluetoothService>();

  BluetoothStream() {
    _orgBluezDbus = OrgBluez(client, 'org.bluez', path: DBusObjectPath('/'));
    _orgBluezHCI0 = OrgBluezHCI0(client, 'org.bluez',
        path: DBusObjectPath('/org/bluez/hci0'));
    _startBluetoothServiceStream();
  }

  Future<void> _getInitialState() async {
    await _orgBluezDbus.intialize();
    await _orgBluezHCI0.intialize();

    bluetoothService.sink.add(BluetoothService(
        connectedDevices: _orgBluezDbus.connectedDevices,
        discovering: _orgBluezHCI0.isBluetoothDiscovering,
        enabled: _orgBluezHCI0.isBluetoothEnabled));
  }

  Future<void> _startBluetoothServiceStream() async {
    await _getInitialState();

    final streamGroup = StreamGroup.merge([
      _orgBluezHCI0.bluetoothEnabled.stream,
      _orgBluezDbus.connectedDevicesStream.stream,
    ]);

    streamGroup.listen((event) {
      bluetoothService.sink.add(BluetoothService(
          connectedDevices: _orgBluezDbus.connectedDevices,
          discovering: _orgBluezHCI0.isBluetoothDiscovering,
          enabled: _orgBluezHCI0.isBluetoothEnabled));
    });
  }
}
