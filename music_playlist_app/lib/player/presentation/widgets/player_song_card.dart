import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_playlist_app/core/extension/int_extension.dart';
import 'package:music_playlist_app/core/resources/app_palettes.dart';
import 'package:music_playlist_app/playlist_manage/domain/entities/song_entity.dart';
import 'package:music_playlist_app/shares/presentation/widgets/music_button_shell.dart';

class PlayerSongCard extends StatelessWidget {
  const PlayerSongCard(
      {super.key,
      required this.song,
      required this.onSelectedSong,
      required this.isSelected,
      required this.isPause});
  final SongEntity song;
  final Function(SongEntity) onSelectedSong;
  final bool isSelected;
  final bool isPause;

  @override
  Widget build(BuildContext context) {
    return MusicButtonShell(
      onTap: () => (isSelected) ? null : onSelectedSong(song),
      child: Container(
        color: (isSelected) ? AppPalettes.primaryLight : AppPalettes.primary,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  height: 64,
                  width: 64,
                  child: Image.network(song.image),
                ),
                Visibility(
                  visible: isSelected,
                  child: Container(
                    height: 64,
                    width: 64,
                    color: Colors.black.withOpacity(0.4),
                    child: Lottie.asset('assets/animation/audio-animation.json',
                        repeat: true, animate: !isPause),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(song.artist,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text("${song.title} • ${song.duration.getFormattedDuration}",
                      style: TextStyle(color: Colors.white.withOpacity(0.6)))
                ])),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.short_text_rounded,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
