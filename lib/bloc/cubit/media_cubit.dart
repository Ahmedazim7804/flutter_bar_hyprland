import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bar/streams/media_stream.dart';
part 'media_state.dart';

class MediaCubit extends Cubit<MediaState> {
  MediaCubit() : super(NoMedia()) {
    MediaStream().eventListener.stream.listen((event) {
      if (event.playing == Status.PLAYING) {
        emit(MediaStatePlaying(mediaStatus: event));
      } else {
        emit(MediaStatePaused(mediaStatus: event));
      }
    });
  }
}
