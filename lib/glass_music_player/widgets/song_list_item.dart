import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SongListItem extends StatelessWidget {
  final String title;
  final String artist;

  const SongListItem({
    Key? key,
    required this.title,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add play song functionality
        print('Playing: $title by $artist');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (artist.isNotEmpty) ...[
                    SizedBox(height: 2),
                    Text(
                      artist,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  // Add play functionality
                  print('Play button pressed for: $title');
                },
                icon: Icon(
                  Icons.play_arrow_sharp,
                  color: Colors.white,
                  size: 30,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}