import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'battery_state.dart';

class BatteryCubit extends Cubit<BatteryState> {
  BatteryCubit() : super(BatteryInitial());
}
