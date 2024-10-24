import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_playlist_app/core/extension/int_extension.dart';
import 'package:music_playlist_app/core/resources/app_palettes.dart';
import 'package:music_playlist_app/player/presentation/bloc/global_audio_player_cubit/global_audio_player_cubit.dart';

class PlayerPlayingCard extends StatelessWidget {
  const PlayerPlayingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalAudioPlayerCubit, GlobalAudioPlayerState>(
      builder: (context, state) {
        final cubit = context.read<GlobalAudioPlayerCubit>();
        final song = state.selectedSong;

        if (song == null) return const SizedBox();

        return Container(
          color: AppPalettes.primaryDeep,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                height: 64,
                width: 64,
                child: Image.network(song.image),
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(song.artist,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text(
                        "${song.title} • ${state.duration.getFormattedDuration}",
                        style: TextStyle(color: Colors.white.withOpacity(0.6)))
                  ])),
              IconButton(
                  onPressed: () => cubit.onTogglePlayPause(),
                  icon: (state.isPause)
                      ? const Icon(Icons.play_arrow)
                      : const Icon(Icons.pause),
                  color: Colors.white),
              IconButton(
                onPressed: () => cubit.onNextSong(),
                icon: const Icon(Icons.skip_next, color: Colors.white),
              )
            ],
          ),
        );
      },
    );
  }
}
