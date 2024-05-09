import 'package:bar/dbus/upower_dbus.dart';
import 'package:dbus/dbus.dart';

class Battery {
  Battery({required this.chargingState, required this.percentage}) {
    if (percentage < 20) {
      lowBattery = true;
    } else {
      lowBattery = false;
    }
  }

  final BatteryCharging chargingState;
  final double percentage;
  late final bool lowBattery;

  static Battery empty() {
    return Battery(chargingState: BatteryCharging.DISCHARGING, percentage: 0);
  }

  factory Battery.fromJson(Map<String, DBusValue?> info) {
    double perc = info['Percentage']!.asDouble();
    int state = info['State']!.asUint32();

    return Battery(
        chargingState: BatteryCharging.fromValue(state), percentage: perc);
  }
}
