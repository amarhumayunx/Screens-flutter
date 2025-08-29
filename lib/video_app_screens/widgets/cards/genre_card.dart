import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenreCard extends StatelessWidget {
  final String genreName;
  final List<Color> colors;
  final VoidCallback onTap;

  const GenreCard({
    super.key,
    required this.genreName,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: colors,
                center: Alignment.center,
                radius: 0.9,
              ),
              boxShadow: [
                BoxShadow(
                  color: colors[0].withOpacity(0.6),
                  blurRadius: 25,
                  spreadRadius: 8,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Center(
              child: Text(
                genreName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            genreName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
