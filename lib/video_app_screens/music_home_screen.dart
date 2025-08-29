import 'package:flutter/material.dart';
import 'package:screen/video_app_screens/widgets/bottom_navbar.dart';
import 'package:screen/video_app_screens/widgets/cards/genre_card.dart';
import 'package:screen/video_app_screens/widgets/section/genre_section.dart';
import 'package:screen/video_app_screens/widgets/header.dart';
import 'package:screen/video_app_screens/widgets/section/popular_songs_section.dart';
import 'package:screen/video_app_screens/widgets/section/music_card_section.dart';
import 'package:screen/video_app_screens/widgets/section/new_single_section.dart';
import 'package:screen/video_app_screens/widgets/section/popular_artists_section.dart';


class MusicHomeScreen extends StatelessWidget {
  const MusicHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    const Header(),
                    SizedBox(height: 20),

                    // Current Playing Card
                    MusicCardsSection(),
                    SizedBox(height: 20),

                    // Popular Artists Section
                    PopularArtistsSection(),
                    SizedBox(height: 20),

                    // New Singles Section
                    NewSinglesSection(),

                    PopularSongsSection(),

                    GenresSection(),




                    SizedBox(height: 50), // give space above bottom navbar
                  ],
                ),
              ),
            ),

            // Bottom Navigation (fixed)
            BottomNavbar(),
          ],
        ),
      ),
    );
  }
}
