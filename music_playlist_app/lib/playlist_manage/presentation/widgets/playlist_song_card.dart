import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:music_playlist_app/core/resources/app_palettes.dart';
import 'package:music_playlist_app/playlist_manage/domain/entities/song_entity.dart';
import 'package:music_playlist_app/playlist_manage/presentation/bloc/playlist_manage/playlist_manage_cubit.dart';
import 'package:music_playlist_app/shares/presentation/widgets/music_button_shell.dart';

class PlaylistSongCard extends StatelessWidget {
  const PlaylistSongCard(
      {super.key,
      required this.song,
      required this.onSelectedSong,
      required this.isSelected});
  final SongEntity song;
  final Function(SongEntity) onSelectedSong;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return MusicButtonShell(
      onTap: () => (isSelected) ? null : onSelectedSong(song),
      child: Container(
        color: (isSelected) ? AppPalettes.primaryLight : AppPalettes.primary,
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  height: 64,
                  width: 64,
                  child: Image.network(song.image),
                ),
                Visibility(
                  visible: isSelected,
                  child: Container(
                    height: 64,
                    width: 64,
                    color: Colors.black.withOpacity(0.8),
                    child: Lottie.asset('assets/animation/audio-animation.json',
                        repeat: true),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(song.artist,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text("${song.title} • ${song.getFormattedDuration()}",
                      style: TextStyle(color: Colors.white.withOpacity(0.6)))
                ])),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.short_text_rounded,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
