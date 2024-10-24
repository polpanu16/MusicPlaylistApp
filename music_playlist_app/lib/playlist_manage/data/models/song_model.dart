import 'package:music_playlist_app/playlist_manage/domain/entities/song_entity.dart';

class SongModel extends SongEntity {
  SongModel(
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
      genre: json['genre'],
      source: json['source'],
      image: json['image'],
      trackNumber: json['trackNumber'],
      totalTrackCount: json['totalTrackCount'],
      duration: json['duration'],
      site: json['site'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'album': album,
      'artist': artist,
      'genre': genre,
      'source': source,
      'image': image,
      'trackNumber': trackNumber,
      'totalTrackCount': totalTrackCount,
      'duration': duration,
      'site': site,
    };
  }
}
