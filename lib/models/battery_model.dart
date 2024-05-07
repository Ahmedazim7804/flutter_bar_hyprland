import 'package:bar/dbus/upower_dbus.dart';

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
    return Battery(chargingState: BatteryCharging.UNKNOWN, percentage: 0);
  }
}
