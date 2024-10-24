import 'package:flutter/material.dart';
import 'package:music_playlist_app/home/presentation/widgets/play_list_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Playlist"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlayListCard(),
            PlayListCard(),
            PlayListCard(),
            PlayListCard(),
            PlayListCard()
          ],
        ),
      ),
    );
  }
}
