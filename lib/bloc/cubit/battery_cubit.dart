import 'package:bar/dbus/upower_dbus.dart';
import 'package:bar/models/battery_model.dart';
import 'package:bar/streams/battery_stream.dart';
import 'package:bloc/bloc.dart';

part 'battery_state.dart';

class BatteryCubit extends Cubit<BatteryState> {
  final BatteryStream batteryStream = BatteryStream();

  BatteryCubit() : super(BatteryInitial(battery: Battery.empty())) {
    batteryStream
        .getBatteryInfo()
        .then((Battery battery) => emit(BatteryInitial(battery: battery)));

    listenForChanges();
  }

  void listenForChanges() {
    batteryStream.eventListener.stream.listen((battery) {
      print(battery.chargingState);
      if (battery.chargingState == BatteryCharging.CHARGING) {
        emit(BatteryStateCharging(battery: battery));
      } else {
        emit(BatteryStateDischarging(battery: battery));
      }
    });
  }
}
