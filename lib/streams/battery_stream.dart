import 'dart:async';
import 'package:bar/dbus/upower_dbus.dart';
import 'package:bar/models/battery_model.dart';
import 'package:dbus/dbus.dart';

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

  Future<void> _getInitialState() async {
    eventListener.sink.add(await getBatteryInfo());
  }

  Future<Battery> getBatteryInfo() async {
    double perc = (await _object.getPercentage()).asDouble();
    int state = (await _object.getState()).asUint32();

    return Battery(
        chargingState: BatteryCharging.fromValue(state), percentage: perc);
  }

  void _startStream() async {
    await _getInitialState();

    _object.getStreamOf({'State', 'Percentage'}).listen((event) async {
      eventListener.sink.add(Battery.fromJson(event));
    });
  }
}
