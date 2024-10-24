import 'package:flutter/material.dart';

class PlayListCard extends StatelessWidget {
  const PlayListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 16),
            height: 64,
            width: 64,
            color: Colors.amber,
          ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Title"), Text("Sub Title")])),
          IconButton(onPressed: () {}, icon: Icon(Icons.play_circle))
        ],
      ),
    );
  }
}
