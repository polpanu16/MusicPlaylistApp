part of 'playlist_manage_cubit.dart';

final class PlaylistManageState extends Equatable {
  final StateStatus stateStatus;
  final List<SongEntity> songs;
  final SongEntity? selectedSong;
  final AudioPlayer audioPlayer;
  final bool isPause;

  PlaylistManageState(
      {this.stateStatus = StateStatus.init,
      this.songs = const [],
      this.selectedSong,
      this.isPause = false,
      AudioPlayer? audioPlayer})
      : audioPlayer = audioPlayer ?? AudioPlayer();

  PlaylistManageState copyWith(
      {StateStatus? stateStatus,
      List<SongEntity>? songs,
      SongEntity? selectedSong,
      bool? isPause,
      AudioPlayer? audioPlayer}) {
    return PlaylistManageState(
        stateStatus: stateStatus ?? this.stateStatus,
        songs: songs ?? this.songs,
        selectedSong: selectedSong ?? this.selectedSong,
        isPause: isPause ?? this.isPause,
        audioPlayer: this.audioPlayer);
  }

  @override
  List<Object?> get props =>
      [stateStatus, songs, selectedSong, audioPlayer, isPause];
}
