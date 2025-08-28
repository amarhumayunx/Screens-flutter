import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      height: 280, // Fixed height for better control
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(currentSong.albumArt),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4), // Lighter overlay
            BlendMode.darken,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // Gradient overlay for better text visibility at bottom
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.7), // Darker at bottom
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [0.0, 0.6],
          ),
        ),
        child: Column(
          children: [
            // Spacer to push content to bottom
            const Spacer(),

            // Bottom section with text (left) and play button (right)
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Text Section (left side)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        currentSong.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: const Offset(1, 1),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        currentSong.artist,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              offset: const Offset(1, 1),
                              blurRadius: 3,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Play button (right side)
                Container(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.play_circle_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      // Handle play/pause
                      print("Play/Pause clicked");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}