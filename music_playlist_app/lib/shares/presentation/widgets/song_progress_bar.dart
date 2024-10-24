import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_playlist_app/player/presentation/bloc/global_audio_player_cubit/global_audio_player_cubit.dart';

class SongProgressBar extends StatelessWidget {
  const SongProgressBar({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalAudioPlayerCubit, GlobalAudioPlayerState>(
      builder: (context, state) {
        return LinearProgressIndicator(
          color: color,
          backgroundColor: color?.withOpacity(0.2),
          value: state.getDurationProgressBar,
        );
      },
    );
  }
}
