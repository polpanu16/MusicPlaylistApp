import 'package:music_playlist_app/playlist_manage/domain/entities/song_entity.dart';

class GetSongsResponseEntity {
  final List<SongEntity> music;

  GetSongsResponseEntity({required this.music});
}
