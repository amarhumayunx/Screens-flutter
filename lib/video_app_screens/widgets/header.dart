import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
              "https://m.media-amazon.com/images/I/41Uafp9ejYL._SX300_SY300_QL70_FMwebp_.jpg",
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 15,
                ),
              ),
              Text(
                "Hi, Linh Nguyen",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.more_horiz,
            color: Colors.grey,
            size: 26,
          ),
        ],
      ),
    );
  }
}
