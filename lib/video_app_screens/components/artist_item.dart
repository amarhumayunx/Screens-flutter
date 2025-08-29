import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/artists.dart';

class ArtistItem extends StatelessWidget {
  final Artist artist;

  const ArtistItem({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(artist.imageUrl),
              onBackgroundImageError: (exception, stackTrace) {
                // Handle error (optional logging, fallback image, etc.)
              },
            ),
          ),
          const SizedBox(height: 10),
          Text(
            artist.name,
            style: TextStyle(
              fontSize: 14,
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
