import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_playlist_app/core/resources/app_palettes.dart';
import 'package:music_playlist_app/playlist_manage/presentation/bloc/playlist_manage/playlist_manage_cubit.dart';

class PlaylistAudioPlayerCard extends StatelessWidget {
  const PlaylistAudioPlayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistManageCubit, PlaylistManageState>(
      builder: (context, state) {
        final cubit = context.read<PlaylistManageCubit>();
        final song = state.selectedSong;

        if (song == null) return SizedBox();

        return Container(
          color: AppPalettes.primaryDeep,
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 16),
                height: 64,
                width: 64,
                child: Image.network(song.image),
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
                  onPressed: () => cubit.onTogglePlayPause(),
                  icon: (state.isPause)
                      ? Icon(Icons.play_arrow)
                      : Icon(Icons.pause),
                  color: Colors.white),
              IconButton(
                onPressed: () => cubit.onNextSong(),
                icon: Icon(Icons.skip_next, color: Colors.white),
              )
            ],
          ),
        );
      },
    );
  }
}
