import 'package:music_playlist_app/core/resources/data_state.dart';
import 'package:music_playlist_app/playlist_manage/data/data_sources/remote_playlist_manage.dart';
import 'package:music_playlist_app/playlist_manage/domain/entities/response/get_songs_response_entity.dart';
import 'package:music_playlist_app/playlist_manage/domain/repositories/playlist_manage_repository.dart';
import 'package:music_playlist_app/shares/domain/repositories/base_repository.dart';

class PlaylistManageRepositoryImpl extends BaseApiRepository
    implements PlaylistManageRepository {
  PlaylistManageRepositoryImpl(
      {required super.dio, PlaylistManageService? remote})
      : _remote = remote ?? PlaylistManageService(dio);

  final PlaylistManageService _remote;

  @override
  Future<DataState<GetSongsResponseEntity>> getSongsResponseEntity() async {
    return getStateOf<GetSongsResponseEntity>(() => _remote.getSongs());
  }
}
