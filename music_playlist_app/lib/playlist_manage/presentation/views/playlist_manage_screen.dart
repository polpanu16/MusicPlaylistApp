import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_playlist_app/core/enums/genre_type.dart';
import 'package:music_playlist_app/core/resources/locator.dart';
import 'package:music_playlist_app/playlist_manage/presentation/bloc/playlist_manage/playlist_manage_cubit.dart';
import 'package:music_playlist_app/player/presentation/widgets/player_playing_card.dart';
import 'package:music_playlist_app/playlist_manage/presentation/widgets/playlist_card.dart';
import 'package:music_playlist_app/shares/presentation/widgets/song_progress_bar.dart';

class PlaylistManageScreen extends StatelessWidget {
  const PlaylistManageScreen({super.key});

  PlaylistManageCubit get providedCubit => getIt.get<PlaylistManageCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => providedCubit..init(),
      child: Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            title: const Text('My Playlist'),
          ),
          body: SafeArea(
            child: BlocBuilder<PlaylistManageCubit, PlaylistManageState>(
              builder: (context, state) {
                final allType = GenreType.values.toList();

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(allType.length,
                          (index) => PlaylistCard(type: allType[index]))
                    ],
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                SongProgressBar(color: Colors.amberAccent),
                PlayerPlayingCard()
              ])),
    );
  }
}
