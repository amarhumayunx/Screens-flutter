import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/songs.dart';
import '../cards/music_card.dart';

class MusicCardsSection extends StatefulWidget {
  MusicCardsSection({super.key});

  @override
  State<MusicCardsSection> createState() => _MusicCardsSectionState();
}

class _MusicCardsSectionState extends State<MusicCardsSection> {
  late PageController _pageController;
  int _currentIndex = 0;

  final List<Song> songs = [
    Song(
      title: "Justice",
      artist: "Justin Bieber",
      albumArt: "https://m.media-amazon.com/images/I/A1PCWAm4wlL._SL1500_.jpg",
    ),
    Song(
      title: "Positions",
      artist: "Ariana Grande",
      albumArt: "https://upload.wikimedia.org/wikipedia/en/a/a0/Ariana_Grande_-_Positions.png",
    ),
    Song(
      title: "Future Nostalgia",
      artist: "Dua Lipa",
      albumArt: "https://upload.wikimedia.org/wikipedia/en/f/f5/Dua_Lipa_-_Future_Nostalgia_%28Official_Album_Cover%29.png",
    ),
    Song(
      title: "folklore",
      artist: "Taylor Swift",
      albumArt: "https://upload.wikimedia.org/wikipedia/en/f/f8/Taylor_Swift_-_Folklore.png",
    ),
    Song(
      title: "After Hours",
      artist: "The Weeknd",
      albumArt: "https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20,bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recently Played",
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                "See more",
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        // Scrollable Cards Section
        SizedBox(
          height: 280,
          child: PageView.builder(
            controller: _pageController,
            itemCount: songs.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: MusicCard(song: songs[index]),
              );
            },
          ),
        ),

        // Page Indicator
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            songs.length <= 5 ? songs.length : 5,
                (index) {
              int lastIndex = songs.length - 1;

              int displayIndex;
              if (songs.length <= 5) {
                displayIndex = _currentIndex;
              } else {
                if (_currentIndex <= 2) {
                  displayIndex = _currentIndex;
                } else if (_currentIndex >= lastIndex - 2) {
                  displayIndex = 5 - (lastIndex - _currentIndex) - 1;
                } else {
                  displayIndex = 2;
                }
              }

              bool isActive = index == displayIndex;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive ? Colors.black87 : Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}