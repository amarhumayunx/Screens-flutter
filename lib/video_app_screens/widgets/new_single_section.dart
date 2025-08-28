import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewSingleSection extends StatelessWidget {
  const NewSingleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "New Singles",
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
    );
  }

}
