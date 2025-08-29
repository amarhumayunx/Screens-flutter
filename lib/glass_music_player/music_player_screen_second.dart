import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen/glass_music_player/widgets/bottom_player.dart';
import 'package:screen/glass_music_player/widgets/collection_card.dart';
import 'package:screen/glass_music_player/widgets/song_list_item.dart';
import 'package:screen/glass_music_player/widgets/top_header.dart';

class MusicHomeScreenSecond extends StatelessWidget {
  const MusicHomeScreenSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF8B7ED8),
              Color(0xFFE291AA),
              Color(0xFF9B59B6),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Header
              TopHeader(),

              // Collections Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Collections',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Collection Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CollectionCard(
                        title: 'Chillout',
                        subtitle: '206 songs',
                        color: const Color(0xFFE291AA),
                        image: 'https://media.istockphoto.com/id/1388502527/vector/music-album-cover-for-the-web-presentation-abstract-vector-design-of-cd-cover-and-vinyl.jpg?s=612x612&w=0&k=20&c=JM9YydeUivm4ufVARyySAvI-DFY2E9KuVj08wS4sAFM=', // sample Spotify playlist cover
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: CollectionCard(
                        title: 'Work',
                        subtitle: '137 songs',
                        color: const Color(0xFF2C3E50),
                        image: 'https://images.unsplash.com/photo-1487215078519-e21cc028cb29?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bXVzaWMlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: CollectionCard(
                        title: 'Spiritual',
                        subtitle: '78 songs',
                        color: const Color(0xFF3498DB),
                        image: 'https://media.istockphoto.com/id/2161124245/photo/christians-raising-their-hands-in-praise-and-worship-at-a-night-music-concert.jpg?s=612x612&w=0&k=20&c=2Lt_xDFW_Wt4V20K_BA2fH43ta9hBbQP_y6NfvBjjI0=',
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),

              // Recommended Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Recommended',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Song List
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    SongListItem(
                      title: 'Shape of You',
                      artist: 'Ed Sheeran',
                    ),
                    SongListItem(
                      title: 'Jessica feat. Bado',
                      artist: 'Boys LAB',
                    ),
                    SongListItem(
                      title: 'Mi Cama',
                      artist: 'Karol G',
                    ),
                    SongListItem(
                      title: 'Ona by tak chciała',
                      artist: '',
                    ),
                  ],
                ),
              ),

              // Bottom Player
              BottomPlayer(),
            ],
          ),
        ),
      ),
    );
  }
}