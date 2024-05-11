part of 'media_cubit.dart';

@immutable
sealed class MediaState {}

final class NoMedia extends MediaState {}

final class MediaStatePlaying extends MediaState {
  MediaStatePlaying({required this.mediaStatus});

  final MediaStatus mediaStatus;
}

final class MediaStatePaused extends MediaState {
  MediaStatePaused({required this.mediaStatus});

  final MediaStatus mediaStatus;
}
