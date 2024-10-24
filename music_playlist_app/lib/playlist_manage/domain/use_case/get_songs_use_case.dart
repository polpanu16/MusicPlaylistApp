import 'package:music_playlist_app/core/resources/data_state.dart';
import 'package:music_playlist_app/core/use_case/use_case.dart';
import 'package:music_playlist_app/playlist_manage/domain/entities/response/get_songs_response_entity.dart';
import 'package:music_playlist_app/playlist_manage/domain/repositories/playlist_manage_repository.dart';

class GetSongsUseCase
    implements UseCase<DataState<GetSongsResponseEntity>, void> {
  final PlaylistManageRepository _playlistManageRepository;
  GetSongsUseCase({required PlaylistManageRepository playlistManageRepository})
      : _playlistManageRepository = playlistManageRepository;

  @override
  Future<DataState<GetSongsResponseEntity>> call({required void params}) {
    return _playlistManageRepository.getSongsResponseEntity();
  }
}
