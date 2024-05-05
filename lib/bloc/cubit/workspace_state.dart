part of 'workspace_cubit.dart';

@immutable
sealed class WorkspaceState {
  const WorkspaceState(
      {required this.active,
      required this.numberOfWorkspaces,
      required this.exists});
  final int active;
  final int numberOfWorkspaces;
  final List<int> exists;
}

final class WorkspaceInitial extends WorkspaceState {
  WorkspaceInitial() : super(active: 1, numberOfWorkspaces: 1, exists: [1]);
}

final class WorkspaceChanged extends WorkspaceState {
  const WorkspaceChanged(
      {required int active, required int numberOfWorkspaces, required exists})
      : super(
            active: active,
            numberOfWorkspaces: numberOfWorkspaces,
            exists: exists);
}
