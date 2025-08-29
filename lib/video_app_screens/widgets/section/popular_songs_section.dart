import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/popular_song_data.dart';
import '../../models/popular_songs.dart';

class PopularSongsSection extends StatelessWidget {
  const PopularSongsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularSongs = PopularSongsData.getSamplePopularSongs();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Song',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () => _onSeeAll(context),
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Songs Grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: popularSongs.length,
            itemBuilder: (context, index) {
              final song = popularSongs[index];
              return PopularSongTile(
                song: song,
                onTap: () => _onSongTap(song),
              );
            },
          ),
        ),
      ],
    );
  }

  void _onSeeAll(BuildContext context) {
    // Handle see all tap - navigate to popular songs page
    print('Navigate to see all popular songs');
  }

  void _onSongTap(PopularSong song) {
    // Handle song tap - navigate to player or start playing
    print('Tapped on: ${song.title} by ${song.artist}');
  }
}

class PopularSongTile extends StatelessWidget {
  final PopularSong song;
  final VoidCallback onTap;

  const PopularSongTile({
    Key? key,
    required this.song,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            // Song Cover with proper error handling
            Container(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: song.coverUrl.isNotEmpty
                    ? Image.network(
                  song.coverUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback to colored container with icon when image fails
                    return Container(
                      decoration: BoxDecoration(
                        color: song.backgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.music_note,
                        color: Colors.white,
                        size: 20,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      decoration: BoxDecoration(
                        color: song.backgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                )
                    : Icon(
                  Icons.music_note,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Song Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    song.title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    song.artist,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // More Options
            GestureDetector(
              onTap: () => _showMoreOptions(context, song),
              child: Container(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.grey[400],
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMoreOptions(BuildContext context, PopularSong song) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Add to Favorites'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.playlist_add),
              title: const Text('Add to Playlist'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Download'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}