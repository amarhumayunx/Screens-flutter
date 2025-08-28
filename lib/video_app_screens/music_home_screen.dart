import 'package:flutter/material.dart';
import 'package:screen/video_app_screens/widgets/bottom_navbar.dart';
import 'package:screen/video_app_screens/widgets/current_playing_card.dart';
import 'package:screen/video_app_screens/widgets/header.dart';
import 'package:screen/video_app_screens/widgets/new_single_section.dart';
import 'package:screen/video_app_screens/widgets/popular_artists_section.dart';

import 'models/artists.dart';
import 'models/songs.dart';

class MusicHomeScreen extends StatelessWidget {
  // Sample data with network images


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            const Header(),

            SizedBox(height: 20,),

            // Current Playing Card
            CurrentPlayingCard(),

            SizedBox(height: 20),

            // Popular Artists Section
            PopularArtistsSection(),

            // New Singles Section
            NewSingleSection(),

            const Spacer(),

            // Bottom Navigation
            BottomNavbar(),
          ],
        ),
      ),
    );
  }


}