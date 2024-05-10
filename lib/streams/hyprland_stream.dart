import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:process_run/shell.dart';

enum HyprlandAction {
  WORKSPACE_CHANGED,
  WORKSPACE_CREATED,
  WORKSPACE_DESTROYED,
  ACTIVE_WINDOW_CHANGED;
}

enum Hyprctl {
  WORKSPACES,
}

class WorkspaceModel {
  WorkspaceModel(
      {required this.id,
      required this.monitor,
      required this.windows,
      required this.hasFullScreen,
      required this.lastWindow,
      required this.lastWindowTitle});
  int id;
  String monitor;
  int windows;
  bool hasFullScreen;
  String lastWindow;
  String lastWindowTitle;
}

class HyprlandEvent {
  HyprlandEvent({required this.args, required this.action});
  final List<String> args;
  final HyprlandAction action;
}

class Hyperland {
  late final InternetAddress host1;
  late final InternetAddress host2;
  final Shell _shell = Shell(commandVerbose: false, verbose: false);

  StreamController eventListener = StreamController<HyprlandEvent>();

  Hyperland() {
    const String address1 =
        "/tmp/hypr/84ab8d11e8951a6551d1e1bf87796a8589da6d47_1715337374/.socket.sock";
    const String address2 =
        "/tmp/hypr/84ab8d11e8951a6551d1e1bf87796a8589da6d47_1715337374/.socket2.sock";
    host1 = InternetAddress(address1, type: InternetAddressType.unix);
    host2 = InternetAddress(address2, type: InternetAddressType.unix);

    startSocket();
  }

  Future<String> sendCommand(String command) async {
    List<ProcessResult> processResults = await _shell.run('hyprctl $command');

    return processResults.outText;

    // final ConnectionTask connectionTask = await Socket.startConnect(host1, 80);

    // final completer = Completer<String>();

    // late final StreamSubscription subscription;

    // connectionTask.socket.then((socket) async {
    //   (socket).first.then((event) {
    //     completer.complete(utf8.decode(event));
    //   });
    //   socket.add(utf8.encode(command));
    // });

    // final String output = await completer.future;
    // connectionTask.cancel();
    // return output;
  }

  Future<int> getActiveWorkspace() async {
    String output = await sendCommand('activewindow');

    return int.parse(output
        .replaceAll("\t", "")
        .split("\n")[5]
        .split("workspace: ")[1]
        .split(" ")[0]);
  }

  Future<List<WorkspaceModel>> getWorkspaces() async {
    String output = await get(Hyprctl.WORKSPACES);

    final lines = output.replaceAll("\t", "").split("\n");

    final List<WorkspaceModel> workspaces = [];

    int start = 0;
    int step = 7;
    final int end = lines.length - 1;

    while (start < end) {
      List<String> line = lines.sublist(start, start + 5 + 1);

      int id = int.parse(line[0].split("workspace ID ")[1].split(" ")[0]);
      String monitor = line[1].split("monitorID: ")[1];
      int windows = int.parse(line[2].split("windows: ")[1]);
      bool hasFullScreen =
          line[3].split("hasfullscreen: ")[1] == "0" ? true : false;
      String lastWindow = line[4].split("lastwindow: ")[1];
      String lastWindowTitle = line[5].split("lastwindowtitle: ")[1];

      WorkspaceModel workspaceModel = WorkspaceModel(
          id: id,
          monitor: monitor,
          windows: windows,
          hasFullScreen: hasFullScreen,
          lastWindow: lastWindow,
          lastWindowTitle: lastWindowTitle);

      workspaces.add(workspaceModel);

      start += step;
    }

    return workspaces;
  }

  Future<String> get(Hyprctl action) async {
    late final String output;
    if (action == Hyprctl.WORKSPACES) {
      output = await sendCommand('workspaces');
    }

    return output;
  }

  void startSocket() async {
    final Socket socket = await Socket.connect(host2, 80);
    socket.forEach((event) {
      String s = utf8.decode(event);

      List<String> events = s.split('\n');

      for (String e in events) {
        String eventName = e.split('>>')[0];
        List<String> eventArgs = e.split('>>').sublist(1);

        if (eventName == "workspace" || eventName == "workspacev2") {
          eventListener.sink.add(HyprlandEvent(
              args: eventArgs, action: HyprlandAction.WORKSPACE_CHANGED));
        }

        if (eventName == "activewindow") {
          eventListener.sink.add(HyprlandEvent(
              args: eventArgs, action: HyprlandAction.ACTIVE_WINDOW_CHANGED));
        }
      }
    });
  }
}
