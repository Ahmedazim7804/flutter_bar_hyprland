part of 'audio_cubit.dart';

@immutable
sealed class AudioState {}

final class AudioMuted extends AudioState {}

final class AudioLevel extends AudioState {
  final int level;

  AudioLevel(this.level);
}
