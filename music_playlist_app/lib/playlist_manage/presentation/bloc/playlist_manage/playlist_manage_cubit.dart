import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_playlist_app/core/enums/state_status.dart';
import 'package:music_playlist_app/core/resources/data_state.dart';
import 'package:music_playlist_app/playlist_manage/domain/entities/song_entity.dart';
import 'package:music_playlist_app/playlist_manage/domain/repositories/playlist_manage_repository.dart';
import 'package:music_playlist_app/playlist_manage/domain/use_case/get_songs_use_case.dart';

part 'playlist_manage_state.dart';

class PlaylistManageCubit extends Cubit<PlaylistManageState> {
  final PlaylistManageRepository playlistManageRepository;
  final GetSongsUseCase _getSongsUseCase;

  PlaylistManageCubit(
      {required this.playlistManageRepository,
      GetSongsUseCase? getSongsUseCase})
      : _getSongsUseCase = getSongsUseCase ??
            GetSongsUseCase(playlistManageRepository: playlistManageRepository),
        super(PlaylistManageState());

  void init() async {
    final res = await _getSongsUseCase.call(params: null);

    if (res is DataSuccess) {
      emit(state.copyWith(songs: res.data!.music));
      state.audioPlayer.onPlayerComplete.listen((_) => onNextSong());
    }
  }

  void onSelectSong(SongEntity song) async {
    try {
      emit(state.copyWith(selectedSong: song));
      await state.audioPlayer.play(DeviceFileSource(song.source));
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  void onNextSong() async {
    final currentSong = state.selectedSong;

    if (currentSong != null) {
      final nextSongIndex = state.songs.indexOf(currentSong) + 1;
      final actualIndex =
          nextSongIndex >= state.songs.length ? 0 : nextSongIndex;
      emit(state.copyWith(selectedSong: state.songs[actualIndex]));
      await state.audioPlayer
          .play(DeviceFileSource(state.songs[actualIndex].source));
    }
  }

  void onTogglePlayPause() async {
    if (state.isPause) {
      emit(state.copyWith(isPause: false));
      await state.audioPlayer.resume();
    } else {
      emit(state.copyWith(isPause: true));
      await state.audioPlayer.pause();
    }
  }

  void onUpdateSongsIndex(int oldIndex, int newIndex) async {
    final newSongs = List<SongEntity>.from(state.songs)
      ..removeAt(oldIndex)
      ..insert((oldIndex < newIndex) ? newIndex - 1 : newIndex,
          state.songs[oldIndex]);

    print("$oldIndex to $newIndex");
    emit(state.copyWith(songs: newSongs));
  }

  @override
  Future<void> close() async {
    await state.audioPlayer.dispose();
    return super.close();
  }
}
