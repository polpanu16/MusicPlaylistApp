import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_playlist_app/core/resources/app_palettes.dart';
import 'package:music_playlist_app/player/presentation/bloc/global_audio_player_cubit/global_audio_player_cubit.dart';
import 'package:music_playlist_app/playlist_manage/domain/entities/song_entity.dart';
import 'package:music_playlist_app/player/presentation/widgets/player_playing_card.dart';
import 'package:music_playlist_app/player/presentation/widgets/player_song_card.dart';
import 'package:music_playlist_app/shares/presentation/widgets/song_progress_bar.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.songs});
  final List<SongEntity> songs;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void initState() {
    context.read<GlobalAudioPlayerCubit>().init(widget.songs);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalettes.primaryDeep,
      body: SafeArea(
        child: BlocBuilder<GlobalAudioPlayerCubit, GlobalAudioPlayerState>(
          builder: (context, state) {
            final cubit = context.read<GlobalAudioPlayerCubit>();

            return Column(
              children: [
                const PlayerPlayingCard(),
                const SongProgressBar(),
                Flexible(
                    child: ReorderableListView.builder(
                  itemCount: state.songs.length,
                  itemBuilder: (context, index) {
                    return PlayerSongCard(
                        key: ValueKey(state.songs[index]),
                        song: state.songs[index],
                        onSelectedSong: cubit.onSelectSong,
                        isSelected: state.selectedSong == state.songs[index],
                        isPause: state.isPause);
                  },
                  onReorder: cubit.onUpdateSongsIndex,
                ))
              ],
            );
          },
        ),
      ),
    );
  }
}
