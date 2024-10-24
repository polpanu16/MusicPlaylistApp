import 'package:equatable/equatable.dart';
import 'package:music_playlist_app/core/enums/genre_type.dart';

class SongEntity extends Equatable {
  final String id;
  final String title;
  final String album;
  final String artist;
  final GenreType genre;
  final String source;
  final String image;
  final int trackNumber;
  final int totalTrackCount;
  final int duration;
  final String site;

  const SongEntity({
    required this.id,
    required this.title,
    required this.album,
    required this.artist,
    required this.genre,
    required this.source,
    required this.image,
    required this.trackNumber,
    required this.totalTrackCount,
    required this.duration,
    required this.site,
  });

  // Method to get a brief description of the song
  String getDescription() {
    return '$title by $artist from the album "$album"';
  }

  @override
  List<Object?> get props => [
        id,
        title,
        album,
        artist,
        genre,
        source,
        image,
        trackNumber,
        totalTrackCount,
        duration,
        site,
      ];
}
