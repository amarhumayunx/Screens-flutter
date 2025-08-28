import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/artists.dart';

class ArtistItem extends StatelessWidget {
  final Artist artist;

  const ArtistItem({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 38,
            backgroundImage: NetworkImage(artist.imageUrl),
            onBackgroundImageError: (exception, stackTrace) {
              // Handle error (optional logging, fallback image, etc.)
            },
          ),
          const SizedBox(height: 8),
          Text(
            artist.name,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
