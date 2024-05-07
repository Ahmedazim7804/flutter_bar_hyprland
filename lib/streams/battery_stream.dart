import 'dart:async';
import 'package:bar/dbus/upower_dbus.dart';
import 'package:bar/models/battery_model.dart';
import 'package:dbus/dbus.dart';
import 'package:flutter/cupertino.dart';

class BatteryStream {
  final StreamController eventListener = StreamController<Battery>.broadcast();
  late final DBusClient _client;
  late final OrgFreedesktopUPower _object;

  BatteryStream() {
    _client = DBusClient.system();
    _object = OrgFreedesktopUPower(_client, "org.freedesktop.UPower",
        path: DBusObjectPath('/org/freedesktop/UPower/devices/battery_BAT0'));

    _startStream();
  }

  Future<Battery> getBatteryInfo() async {
    double perc = await _object.getPercentage();
    int state = await _object.getState();

    return Battery(
        chargingState: BatteryCharging.fromValue(state), percentage: perc);
  }

  void _startStream() {
    _object.propertiesChanged.listen((signal) async {
      if (signal.changedProperties.containsKey("State") ||
          signal.changedProperties.containsKey("Percentage")) {
        eventListener.sink.add(await getBatteryInfo());
      }
    });
  }
}
