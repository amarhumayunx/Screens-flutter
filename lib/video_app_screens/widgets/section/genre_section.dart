import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cards/genre_card.dart';

class GenresSection extends StatelessWidget {
  const GenresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Genres',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),

          // Genre Cards Row
          Row(
            children: [
              Expanded(
                child: GenreCard(
                  genreName: 'Pop',
                  colors: [Colors.pink.shade300, Colors.orange.shade100],
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: GenreCard(
                  genreName: 'Rock',
                  colors: [Colors.blue.shade400, Colors.blue.shade100],
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: GenreCard(
                  genreName: 'Hip-Hop',
                  colors: [Colors.orange.shade400, Colors.orange.shade100],
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
