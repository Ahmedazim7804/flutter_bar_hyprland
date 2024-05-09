import 'dart:async';
import 'dart:convert';

import 'package:process_run/shell.dart';

enum Status {
  PLAYING,
  PAUSED,
  STOPPED,
}

class MediaStatus {
  final String artist;
  final String title;
  final Status playing;
  final String player;

  MediaStatus(
      {required this.artist,
      required this.title,
      required this.playing,
      required this.player});

  static MediaStatus fromJson(String json) {
    Map<String, dynamic> parsedJson = jsonDecode(json);

    if (parsedJson.isEmpty) {
      return MediaStatus(
          artist: '', title: '', playing: Status.STOPPED, player: '');
    }

    return MediaStatus(
        artist: parsedJson['artist']!,
        title: parsedJson['title']!,
        playing:
            parsedJson['status']! == 'Playing' ? Status.PLAYING : Status.PAUSED,
        player: parsedJson['player']!);
  }

  static MediaStatus empty() {
    return MediaStatus(
        artist: '', title: '', playing: Status.STOPPED, player: '');
  }
}

class MediaStream {
  late final Shell _shell;
  final ShellLinesController shellLinesController = ShellLinesController();

  final StreamController<MediaStatus> eventListener =
      StreamController<MediaStatus>();

  MediaStream() {
    _shell = Shell(
        commandVerbose: false,
        commentVerbose: false,
        verbose: false,
        stdout: shellLinesController.sink,
        stderr: shellLinesController.sink);
    listen();
  }

  void listen() async {
    String command =
        "playerctl -a metadata --format '{\"artist\": \"{{artist}}\", \"title\": \"{{markup_escape(title)}}\", \"status\": \"{{status}}\", \"player\": \"{{playerName}}\"}' -F";
    _shell.run(command);

    shellLinesController.stream.listen(
      (event) {
        eventListener.sink.add(MediaStatus.fromJson(event));
      },
    );
  }
}
