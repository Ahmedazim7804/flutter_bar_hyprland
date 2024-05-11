import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wayland_layer_shell/types.dart';
import 'package:wayland_layer_shell/wayland_layer_shell.dart';

part 'controlpanel_state.dart';

class ControlPanelCubit extends Cubit<ControlPanelState> {
  bool isHidden = true;
  final WaylandLayerShell _layerShell = WaylandLayerShell();
  ControlPanelCubit() : super(ControlPanelHide());

  void hide() {
    isHidden = true;
    _layerShell.setLayer(ShellLayer.layerBackground);
    emit(ControlPanelHide());
  }

  void show() {
    isHidden = false;
    _layerShell.setLayer(ShellLayer.layerOverlay);
    emit(ControlPanelShow());
  }

  void toggle() {
    if (isHidden) {
      _layerShell.setLayer(ShellLayer.layerOverlay);

      emit(ControlPanelShow());
    } else {
      _layerShell.setLayer(ShellLayer.layerBackground);
      emit(ControlPanelHide());
    }

    isHidden = !isHidden;
  }
}
