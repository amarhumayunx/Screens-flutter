// File: lib/widgets/cards/single_card.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/single_model.dart';

class SingleCard extends StatelessWidget {
  final SingleModel single;

  const SingleCard({
    super.key,
    required this.single,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Single tapped: ${single.title}");
      },
      child: SizedBox( // 👈 ensure fixed size container
        width: 190,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Album cover with play button
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Image.network(
                    single.coverUrl,
                    height: 160,
                    width: 160,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 160,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.music_note,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Play Button
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      print("Play button tapped for: ${single.title}");
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      child: const Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Title & Artist
            Text(
              single.title,
              style: TextStyle(
                fontSize: 12, // Reduced further
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 1.2, // Reduced line height
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              single.artist,
              style: TextStyle(
                fontSize: 10, // Reduced further
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.grey[600],
                height: 1.2, // Reduced line height
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
