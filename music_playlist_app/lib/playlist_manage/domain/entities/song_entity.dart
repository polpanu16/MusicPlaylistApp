import 'package:equatable/equatable.dart';

class SongEntity extends Equatable {
  final String id;
  final String title;
  final String album;
  final String artist;
  final String genre;
  final String source;
  final String image;
  final int trackNumber;
  final int totalTrackCount;
  final int duration;
  final String site;

  SongEntity({
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

  // Method to get formatted duration (e.g., "1:30" for 90 seconds)
  String getFormattedDuration() {
    final minutes = (duration / 60).floor();
    final seconds = duration % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

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
