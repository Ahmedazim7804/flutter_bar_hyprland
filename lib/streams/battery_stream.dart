import 'dart:async';
import 'package:bar/dbus/upower_dbus.dart';
import 'package:dbus/dbus.dart';

class BatteryStream {
  final StreamController eventListener =
      StreamController<BatteryState>.broadcast();
  late final DBusClient _client;
  late final OrgFreedesktopUPower _object;

  BatteryStream() {
    _client = DBusClient.system();
    _object = OrgFreedesktopUPower(_client, "org.freedesktop.UPower",
        path: DBusObjectPath('/org/freedesktop/UPower/devices/battery_BAT0'));

    _startStream();
  }

  void _startStream() {
    _object.propertiesChanged.listen((signal) {
      if (signal.changedProperties.containsKey('State')) {
        final stateValue = signal.changedProperties['State']!.asUint32();
        eventListener.sink.add(BatteryState.fromValue(stateValue));
      }
    });
  }
}
