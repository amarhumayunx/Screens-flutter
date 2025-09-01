import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE8B4E8), // Light pink
              Color(0xFFD4B8E8), // Light purple
              Color(0xFFB8D4E8), // Light blue
              Color(0xFFE8D4B8), // Light peach
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Programming',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle menu action
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),

              // Main Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                                text: 'The game is set in\na whimsical, colorful world\nwhere players must solve\ncoding ',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                            ),),
                            TextSpan(
                              text: 'challenges',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Color(0xFFB8B8B8), // Light gray
                              ),
                            ),
                            TextSpan(
                              text: ' to\nprogress through the story',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Color(0xFFB8B8B8), // Light gray
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Section
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Row(
                  children: [
                    // Image/Camera Icon
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.image_outlined,
                        color: Colors.black54,
                        size: 24,
                      ),
                    ),

                    const Spacer(),

                    // Microphone Button
                    Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    const Spacer(),

                    // Close/X Button
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.black54,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}