import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_playlist_app/core/enums/genre_type.dart';
import 'package:music_playlist_app/core/enums/state_status.dart';
import 'package:music_playlist_app/playlist_manage/domain/entities/song_entity.dart';

part 'global_audio_player_state.dart';

class GlobalAudioPlayerCubit extends Cubit<GlobalAudioPlayerState> {
  GlobalAudioPlayerCubit() : super(GlobalAudioPlayerState());

  StreamSubscription<void>? _playerCompleteSubscription;
  StreamSubscription<void>? _playerPositionSubscription;

  void init(List<SongEntity> songs, {bool isAutoPlay = false}) async {
    if (isAutoPlay) {
      final autoplaySong = songs.firstOrNull;
      emit(state.copyWith(
          songs: songs,
          selectedSong: autoplaySong,
          duration: 0,
          isPause: false));
      if (autoplaySong != null && isAutoPlay) {
        await state.audioPlayer.play(DeviceFileSource(autoplaySong.source));
      }
    } else {
      emit(state.copyWith(songs: songs));
    }

    _playerCompleteSubscription?.cancel();
    _playerPositionSubscription?.cancel();

    _playerCompleteSubscription =
        state.audioPlayer.onPlayerComplete.listen((_) => onNextSong());
    _playerPositionSubscription = state.audioPlayer.onPositionChanged
        .listen((duration) => onPositionChanged(duration));
  }

  void onSelectSong(SongEntity song) async {
    try {
      emit(state.copyWith(selectedSong: song, duration: 0));
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
      emit(state.copyWith(
          selectedSong: state.songs[actualIndex], isPause: false, duration: 0));
      await state.audioPlayer
          .play(DeviceFileSource(state.songs[actualIndex].source));
    }
  }

  void onPositionChanged(Duration duration) async {
    emit(state.copyWith(duration: duration.inSeconds));
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

    emit(state.copyWith(songs: newSongs));
  }

  @override
  Future<void> close() async {
    await state.audioPlayer.dispose();
    return super.close();
  }
}
