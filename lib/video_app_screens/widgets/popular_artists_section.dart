import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/popular_artists.dart';
import '../models/artists.dart';
import 'artist_item.dart';

class PopularArtistsSection extends StatelessWidget {
  PopularArtistsSection({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Artists",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                "See all",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            scrollDirection: Axis.horizontal,
            itemCount: popularArtists.length,
            itemBuilder: (context, index) {
              return ArtistItem(artist: popularArtists[index]); // ✅ use the widget
            },
          ),
        )

      ],
    );
  }
}
