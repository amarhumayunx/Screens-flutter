import 'package:flutter/material.dart';
import '../models/popular_songs.dart';

class PopularSongsData {
  static List<PopularSong> getSamplePopularSongs() {
    return [
      PopularSong(
        id: 'ps_001',
        title: 'Stay',
        artist: 'The Kid LAROI, Justin Bieber',
        coverUrl: 'https://m.media-amazon.com/images/I/A1SM0yUP2VL._SL1500_.jpg',
        backgroundColor: const Color(0xFF8B5A96), // Purple
        duration: '2:21',
        playCount: 1250000000,
        isExplicit: false,
        releaseDate: DateTime(2021, 7, 9),
      ),
      PopularSong(
        id: 'ps_002',
        title: 'Industry Baby',
        artist: 'Lil Nas X, Jack Harlow',
        coverUrl: 'https://m.media-amazon.com/images/I/61CpKFzAy+L._UX358_FMwebp_QL85_.jpg',
        backgroundColor: const Color(0xFFE85D75), // Pink
        duration: '3:32',
        playCount: 890000000,
        isExplicit: true,
        releaseDate: DateTime(2021, 7, 23),
      ),
      PopularSong(
        id: 'ps_003',
        title: 'Bad Habits',
        artist: 'Ed Sheeran',
        coverUrl: 'https://m.media-amazon.com/images/I/81zsD5RoiOL._SL1200_.jpg',
        backgroundColor: const Color(0xFF2E8B57), // Sea Green
        duration: '3:51',
        playCount: 1100000000,
        isExplicit: false,
        releaseDate: DateTime(2021, 6, 25),
      ),
      PopularSong(
        id: 'ps_004',
        title: 'Good 4 U',
        artist: 'Olivia Rodrigo',
        coverUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/3/3e/Olivia_Rodrigo_-_Good_4_U.png/512px-Olivia_Rodrigo_-_Good_4_U.png',
        backgroundColor: const Color(0xFFFF6B6B), // Coral
        duration: '2:58',
        playCount: 980000000,
        isExplicit: false,
        releaseDate: DateTime(2021, 5, 14),
      ),
      PopularSong(
        id: 'ps_005',
        title: 'Levitating',
        artist: 'Dua Lipa',
        coverUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/3/3d/Dua_Lipa_Levitating_%28DaBaby_Remix%29.png/512px-Dua_Lipa_Levitating_%28DaBaby_Remix%29.png',
        backgroundColor: const Color(0xFF4ECDC4), // Turquoise
        duration: '3:23',
        playCount: 1050000000,
        isExplicit: false,
        releaseDate: DateTime(2020, 10, 1),
      ),
      PopularSong(
        id: 'ps_006',
        title: 'Heat Waves',
        artist: 'Glass Animals',
        coverUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/b/b0/Glass_Animals_-_Heat_Waves.png/512px-Glass_Animals_-_Heat_Waves.png',
        backgroundColor: const Color(0xFFFFD93D), // Yellow
        duration: '3:58',
        playCount: 1180000000,
        isExplicit: false,
        releaseDate: DateTime(2020, 6, 29),
      ),
    ];
  }

  static List<PopularSong> getFilteredSongs({
    String? genre,
    String? artist,
    bool? isExplicit,
  }) {
    var songs = getSamplePopularSongs();

    if (artist != null) {
      songs = songs
          .where((song) => song.artist.toLowerCase().contains(artist.toLowerCase()))
          .toList();
    }

    if (isExplicit != null) {
      songs = songs.where((song) => song.isExplicit == isExplicit).toList();
    }

    return songs;
  }

  static List<PopularSong> getTopSongs(int limit) {
    var songs = getSamplePopularSongs();
    songs.sort((a, b) => b.playCount.compareTo(a.playCount));
    return songs.take(limit).toList();
  }

  static PopularSong? getSongById(String id) {
    try {
      return getSamplePopularSongs().firstWhere((song) => song.id == id);
    } catch (e) {
      return null;
    }
  }
}
