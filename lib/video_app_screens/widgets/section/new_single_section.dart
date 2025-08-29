import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/single_model.dart';
import '../cards/single_card.dart';

class NewSinglesSection extends StatelessWidget {
  const NewSinglesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header
        Padding(
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
              GestureDetector(
                onTap: () {
                  print("See all new singles tapped");
                },
                child: Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Singles List
        Container(
          height: 230,
          margin: const EdgeInsets.only(top: 20,bottom: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _getSampleSingles().length,
            itemBuilder: (context, index) {
              final single = _getSampleSingles()[index];
              return Padding(
                padding: EdgeInsets.only(
                  right: 2,
                ),
                child: SingleCard(single: single),
              );
            },
          ),
        ),
      ],
    );
  }

  List<SingleModel> _getSampleSingles() {
    return [
      SingleModel(
        id: '1',
        title: 'Happier Than Ever',
        artist: 'Billie Eilish',
        coverUrl: 'https://i.scdn.co/image/ab67616d0000b273a91c10fe9472d9bd89802e5a',
        backgroundColor: const Color(0xFF7ED321),
        isPlaying: false,
      ),
      SingleModel(
        id: '2',
        title: 'Montero',
        artist: 'Lil Nas X',
        coverUrl: 'https://i.scdn.co/image/ab67616d0000b273be82673b5f79d9658ec0a9fd',
        backgroundColor: const Color(0xFF2E3A59),
        isPlaying: false,
      ),
      const SingleModel(
        id: '3',
        title: 'Good 4 U',
        artist: 'Olivia Rodrigo',
        coverUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/3/3e/Olivia_Rodrigo_-_Good_4_U.png/250px-Olivia_Rodrigo_-_Good_4_U.png',
        backgroundColor: Color(0xFFE91E63),
        duration: '2:58',
      ),
      const SingleModel(
        id: '4',
        title: 'Levitating',
        artist: 'Dua Lipa',
        coverUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/3/3d/Dua_Lipa_Levitating_%28DaBaby_Remix%29.png/250px-Dua_Lipa_Levitating_%28DaBaby_Remix%29.png',
        backgroundColor: Color(0xFF9C27B0),
        duration: '3:23',
      ),
    ];
  }
}