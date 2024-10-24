import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_playlist_app/core/resources/app_palettes.dart';
import 'package:music_playlist_app/core/resources/locator.dart';
import 'package:music_playlist_app/playlist_manage/presentation/bloc/playlist_manage/playlist_manage_cubit.dart';
import 'package:music_playlist_app/playlist_manage/presentation/widgets/playlist_audio_player_card.dart';
import 'package:music_playlist_app/playlist_manage/presentation/widgets/playlist_song_card.dart';

class PlaylistManageScreen extends StatelessWidget {
  const PlaylistManageScreen({super.key});

  PlaylistManageCubit get providedCubit => getIt.get<PlaylistManageCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => providedCubit..init(),
      child: Scaffold(
        backgroundColor: AppPalettes.primary,
        body: SafeArea(
          child: BlocBuilder<PlaylistManageCubit, PlaylistManageState>(
            builder: (context, state) {
              final cubit = context.read<PlaylistManageCubit>();

              return Column(
                children: [
                  PlaylistAudioPlayerCard(),
                  Flexible(
                      child: ReorderableListView.builder(
                    itemCount: state.songs.length,
                    itemBuilder: (context, index) {
                      return PlaylistSongCard(
                          key: ValueKey(state.songs[index]),
                          song: state.songs[index],
                          onSelectedSong: cubit.onSelectSong,
                          isSelected: state.selectedSong == state.songs[index]);
                    },
                    onReorder: cubit.onUpdateSongsIndex,
                  ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
