import 'package:flutter/material.dart';
import 'cards/music_card.dart';
import '../models/songs.dart';

class CurrentPlayingCard extends StatelessWidget {
  CurrentPlayingCard({super.key});

  final Song currentSong = Song(
    title: "Justice",
    artist: "Justin Bieber",
    albumArt: "https://m.media-amazon.com/images/I/A1PCWAm4wlL._SL1500_.jpg",
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 280,
      child: MusicCard(song: currentSong),
    );
  }
}