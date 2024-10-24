import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:music_playlist_app/core/enums/genre_type.dart';
import 'package:music_playlist_app/core/resources/app_palettes.dart';
import 'package:music_playlist_app/player/presentation/bloc/global_audio_player_cubit/global_audio_player_cubit.dart';
import 'package:music_playlist_app/player/presentation/views/player_screen.dart';
import 'package:music_playlist_app/playlist_manage/domain/entities/song_entity.dart';
import 'package:music_playlist_app/playlist_manage/presentation/bloc/playlist_manage/playlist_manage_cubit.dart';
import 'package:music_playlist_app/shares/presentation/widgets/music_button_shell.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({super.key, required this.type});
  final GenreType type;

  @override
  Widget build(BuildContext context) {
    final state = context.read<PlaylistManageCubit>().state;
    List<SongEntity> getSongsByType() => state.getSongsByType(type);

    return MusicButtonShell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlayerScreen(songs: getSongsByType())),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  SizedBox(
                    height: 64,
                    width: 64,
                    child: Image.asset(type.imagePath, fit: BoxFit.cover),
                  ),
                  BlocBuilder<GlobalAudioPlayerCubit, GlobalAudioPlayerState>(
                    builder: (context, state) {
                      return Visibility(
                        visible: state.getCurrentType == type,
                        child: Container(
                          height: 64,
                          width: 64,
                          color: Colors.black.withOpacity(0.4),
                          child: Lottie.asset(
                              'assets/animation/audio-animation.json',
                              repeat: true,
                              animate: !state.isPause),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(type.title,
                        style: TextStyle(
                            color: AppPalettes.defaultText,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text(type.subtitle,
                        style: TextStyle(
                            color: AppPalettes.defaultText.withOpacity(0.6),
                            fontSize: 16))
                  ]),
            )),
            IconButton(
                onPressed: () {
                  context
                      .read<GlobalAudioPlayerCubit>()
                      .init(getSongsByType(), isAutoPlay: true);
                },
                icon: const Icon(
                  Icons.play_circle,
                ))
          ],
        ),
      ),
    );
  }
}
