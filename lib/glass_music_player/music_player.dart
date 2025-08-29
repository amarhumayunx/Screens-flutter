import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen/glass_music_player/music_player_screen_second.dart';
import 'dart:ui';
import 'components/glass_container.dart';

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  bool isPlaying = true;
  double currentPosition = 0.25; // 25% progress as shown in image

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
              Color(0xFFf093fb),
              Color(0xFF667eea),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GlassButton(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    Text(
                      'Listen now',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 26,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GlassButton(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => MusicHomeScreenSecond()),
                        );
                      },
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 80),

              // Album Art Container
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(65),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF4158D0),
                          Color(0xFFC850C0),
                          Color(0xFFFFCC70),
                        ],
                      ),
                    ),
                    // This is where you can add your song cover image
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/en/thumb/0/0c/The_Kid_Laroi_and_Justin_Bieber_-_Stay.png/250px-The_Kid_Laroi_and_Justin_Bieber_-_Stay.png', // Replace with your image URL
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Fallback gradient design if image fails to load
                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF667eea).withOpacity(0.8),
                                  Color(0xFF764ba2).withOpacity(0.9),
                                  Color(0xFFf093fb).withOpacity(0.8),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.music_note,
                                size: 60,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          );
                        },
                      ),
                  ),
                ),
              ),

              SizedBox(height: 50),

              // Track Info
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Text(
                      'Psychodelic',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Artist Name',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 16,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 100),

              // Progress Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                        trackHeight: 6,
                        trackShape: RoundedRectSliderTrackShape(), // rounded track
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 10, // bigger thumb
                          pressedElevation: 8, // shadow on press
                        ),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                        activeTrackColor: Colors.transparent, // use gradient
                        inactiveTrackColor: Colors.white.withOpacity(0.15),
                        thumbColor: Colors.white,
                        overlayColor: Colors.white.withOpacity(0.1),
                      ),
                      child: Slider(
                        value: currentPosition,
                        min: 0,
                        max: 100,
                        onChanged: (value) {
                          setState(() {
                            currentPosition = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1:25',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '-3:06',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              // Control Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GlassButton(
                      onTap: () {},
                      size: 55,
                      child: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    GlassButton(
                      onTap: togglePlayPause,
                      size: 70,
                      isPlayButton: true,
                      child: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    GlassButton(
                      onTap: () {},
                      size: 55,
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}