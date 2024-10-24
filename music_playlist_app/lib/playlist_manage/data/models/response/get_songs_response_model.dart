import 'package:music_playlist_app/playlist_manage/data/models/song_model.dart';
import 'package:music_playlist_app/playlist_manage/domain/entities/response/get_songs_response_entity.dart';

class GetSongsResponseModel extends GetSongsResponseEntity {
  GetSongsResponseModel({required super.music});

  factory GetSongsResponseModel.fromJson(Map<String, dynamic> json) {
    return GetSongsResponseModel(
        music: json['music'] == null
            ? []
            : List<SongModel>.from(
                json['music'].map((song) => SongModel.fromJson(song))));
  }
}
