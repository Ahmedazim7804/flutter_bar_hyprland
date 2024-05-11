part of 'controlpanel_cubit.dart';

@immutable
sealed class ControlPanelState {}

final class ControlPanelHide extends ControlPanelState {}

final class ControlPanelShow extends ControlPanelState {}
