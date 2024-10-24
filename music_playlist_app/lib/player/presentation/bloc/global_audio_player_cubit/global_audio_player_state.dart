part of 'global_audio_player_cubit.dart';

final class GlobalAudioPlayerState extends Equatable {
  GlobalAudioPlayerState(
      {this.stateStatus = StateStatus.init,
      this.songs = const [],
      this.selectedSong,
      this.isPause = false,
      this.duration = 0,
      AudioPlayer? audioPlayer})
      : audioPlayer = audioPlayer ?? AudioPlayer();

  final StateStatus stateStatus;
  final List<SongEntity> songs;
  final SongEntity? selectedSong;
  final AudioPlayer audioPlayer;
  final bool isPause;
  final int duration;

  double get getDurationProgressBar {
    final maxDuration = selectedSong?.duration ?? 0;
    return (duration / maxDuration).clamp(0, 1);
  }

  GenreType? get getCurrentType => selectedSong?.genre;

  GlobalAudioPlayerState copyWith(
      {StateStatus? stateStatus,
      List<SongEntity>? songs,
      SongEntity? selectedSong,
      bool? isPause,
      int? duration,
      AudioPlayer? audioPlayer}) {
    return GlobalAudioPlayerState(
        stateStatus: stateStatus ?? this.stateStatus,
        songs: songs ?? this.songs,
        selectedSong: selectedSong ?? this.selectedSong,
        isPause: isPause ?? this.isPause,
        duration: duration ?? this.duration,
        audioPlayer: this.audioPlayer);
  }

  @override
  List<Object?> get props =>
      [stateStatus, songs, selectedSong, audioPlayer, isPause, duration];
}
