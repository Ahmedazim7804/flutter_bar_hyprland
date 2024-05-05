import 'package:bar/streams/hyprland_stream.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'workspace_state.dart';

class WorkspaceCubit extends Cubit<WorkspaceState> {
  Hyperland hyprland = Hyperland();
  WorkspaceCubit() : super(WorkspaceInitial()) {
    refresh();

    hyprland.eventListener.stream.listen((event) async {
      if ((event as HyprlandEvent).action == HyprlandAction.WORKSPACE_CHANGED) {
        List<WorkspaceModel> workspaces = await hyprland.getWorkspaces();

        int numberOfWorkspaces = workspaces
            .reduce((curr, next) => curr.id > next.id ? curr : next)
            .id;

        emit(WorkspaceChanged(
            active: int.parse(event.args[0]),
            numberOfWorkspaces: numberOfWorkspaces,
            exists: workspaces.map((e) => e.id).toList()));
      }
    });
  }

  void refresh() async {
    List<WorkspaceModel> workspaces = await hyprland.getWorkspaces();

    int numberOfWorkspaces =
        workspaces.reduce((curr, next) => curr.id > next.id ? curr : next).id;
    int activeWorkspace = await hyprland.getActiveWorkspace();

    emit(WorkspaceChanged(
        active: activeWorkspace,
        numberOfWorkspaces: numberOfWorkspaces,
        exists: workspaces.map((e) => e.id).toList()));
  }
}
