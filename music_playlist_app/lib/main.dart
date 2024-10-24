import 'package:flutter/material.dart';
import 'package:music_playlist_app/core/resources/locator.dart';
import 'package:music_playlist_app/home/presentation/views/home_screen.dart';
import 'package:music_playlist_app/playlist_manage/presentation/views/playlist_manage_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Playlist App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PlaylistManageScreen(),
    );
  }
}
