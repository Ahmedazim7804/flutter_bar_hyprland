import 'dart:async';
import 'package:bar/models/volume_model.dart';
import 'package:process_run/process_run.dart';

class AudioStream {
  late final Shell _shell;
  late final Shell _shell2;

  final StreamController<Volume> eventListener =
      StreamController<Volume>.broadcast();
  final ShellLinesController _shellLinesController = ShellLinesController();
  final ShellLinesController _shellLinesController2 = ShellLinesController();

  AudioStream() {
    _shell = Shell(
        commandVerbose: false,
        commentVerbose: false,
        verbose: false,
        stdout: _shellLinesController.sink);
    _shell2 = Shell(
      commandVerbose: false,
      commentVerbose: false,
      verbose: false,
      stdout: _shellLinesController2.sink,
    );

    _listenForChanges();
  }

  void _getInitialState() {
    _getVolume();
  }

  void _getVolume() {
    _shell2.run(
      "pamixer --get-volume --get-mute",
    );
  }

  void _listenForChanges() {
    _shell.run("pactl subscribe");

    _shellLinesController.stream.listen((event) {
      print(event);
      _getVolume();
    });

    _shellLinesController2.stream.listen((event) {
      bool mute = event.split(' ')[0] == 'true' ? true : false;
      int volume = int.parse(event.split(' ')[1]);

      eventListener.sink.add(Volume(volume: volume, mute: mute));
    });

    _getInitialState();
  }
}
