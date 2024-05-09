import 'package:bar/streams/audio_stream.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioStream audioStream = AudioStream();
  AudioCubit() : super(AudioMuted()) {
    listen();
  }

  void listen() {
    audioStream.eventListener.stream.listen((volume) {
      print(volume);
      if (volume.mute) {
        emit(AudioMuted());
      } else {
        emit(AudioLevel(volume.volume));
      }
    });
  }
}
