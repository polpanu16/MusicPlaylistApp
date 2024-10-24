import 'package:music_playlist_app/core/enums/genre_type.dart';
import 'package:music_playlist_app/playlist_manage/domain/entities/song_entity.dart';

class SongModel extends SongEntity {
  const SongModel(
      {required super.id,
      required super.title,
      required super.album,
      required super.artist,
      required super.genre,
      required super.source,
      required super.image,
      required super.trackNumber,
      required super.totalTrackCount,
      required super.duration,
      required super.site});

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'],
      title: json['title'],
      album: json['album'],
      artist: json['artist'],
      genre: genreTypeFromString(json['genre']),
      source: json['source'],
      image: json['image'],
      trackNumber: json['trackNumber'],
      totalTrackCount: json['totalTrackCount'],
      duration: json['duration'],
      site: json['site'],
    );
  }
}
