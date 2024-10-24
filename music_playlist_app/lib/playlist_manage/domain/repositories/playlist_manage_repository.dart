import 'package:music_playlist_app/core/resources/data_state.dart';
import 'package:music_playlist_app/playlist_manage/domain/entities/response/get_songs_response_entity.dart';

abstract class PlaylistManageRepository {
  Future<DataState<GetSongsResponseEntity>> getSongsResponseEntity();
}
