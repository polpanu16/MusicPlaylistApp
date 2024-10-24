import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_playlist_app/core/enums/genre_type.dart';
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
        super(const PlaylistManageState());

  Future<void> init() async {
    final res = await _getSongsUseCase.call(params: null);

    if (res is DataSuccess) {
      emit(state.copyWith(songs: res.data!.music));
    }
  }
}
