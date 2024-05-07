part of 'battery_cubit.dart';

sealed class BatteryState {
  const BatteryState({required this.battery});
  final Battery battery;
}

final class BatteryInitial extends BatteryState {
  BatteryInitial({required Battery battery}) : super(battery: battery);
}

final class BatteryStateCharging extends BatteryState {
  const BatteryStateCharging({required Battery battery})
      : super(battery: battery);
}

final class BatteryStateDischarging extends BatteryState {
  const BatteryStateDischarging({required Battery battery})
      : super(battery: battery);
}
