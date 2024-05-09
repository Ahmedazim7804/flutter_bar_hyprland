import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as path;

class BrightnessStream {
  late final FileSystemEntity backlightPath;
  late final File _fileToWatch;

  final StreamController<int> eventListener = StreamController<int>();

  BrightnessStream() {
    backlightPath = _backlightPath;

    final pathToWatch = path.join(backlightPath.path, 'brightness');
    _fileToWatch = File(pathToWatch);

    _listen();
  }

  int getMaxBrightness() {
    final file = File(path.join(backlightPath.path, 'max_brightness'));
    return int.parse(file.readAsStringSync());
  }

  FileSystemEntity get _backlightPath {
    final myDir = Directory('/sys/class/backlight/');

    return myDir.listSync().first;
  }

  Future<int> get brightnessPercentage async {
    final brightness = await _fileToWatch.readAsString();
    final maxBrightness = getMaxBrightness();

    return (int.parse(brightness) / maxBrightness * 100).round();
  }

  void _getInitialBrightness() async {
    eventListener.sink.add(await brightnessPercentage);
  }

  void _listen() {
    _getInitialBrightness();

    _fileToWatch.watch(events: FileSystemEvent.modify).listen((_) async {
      eventListener.sink.add(await brightnessPercentage);
    });
  }
}
