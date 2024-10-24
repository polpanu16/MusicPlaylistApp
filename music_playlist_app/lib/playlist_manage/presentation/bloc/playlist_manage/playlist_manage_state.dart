part of 'playlist_manage_cubit.dart';

final class PlaylistManageState extends Equatable {
  final StateStatus stateStatus;
  final List<SongEntity> songs;

  const PlaylistManageState({
    this.stateStatus = StateStatus.init,
    this.songs = const [],
  });

  List<SongEntity> getSongsByType(GenreType type) =>
      songs.where((song) => song.genre == type).toList();

  PlaylistManageState copyWith({
    StateStatus? stateStatus,
    List<SongEntity>? songs,
  }) {
    return PlaylistManageState(
      stateStatus: stateStatus ?? this.stateStatus,
      songs: songs ?? this.songs,
    );
  }

  @override
  List<Object?> get props => [stateStatus, songs];
}
