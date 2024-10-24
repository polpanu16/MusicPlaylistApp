import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_playlist_app/core/resources/app_palettes.dart';
import 'package:music_playlist_app/core/resources/locator.dart';
import 'package:music_playlist_app/player/presentation/bloc/global_audio_player_cubit/global_audio_player_cubit.dart';
import 'package:music_playlist_app/playlist_manage/presentation/views/playlist_manage_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalAudioPlayerCubit(),
      child: MaterialApp(
        title: 'Music Playlist App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppPalettes.primary),
          useMaterial3: true,
        ),
        home: const PlaylistManageScreen(),
      ),
    );
  }
}
