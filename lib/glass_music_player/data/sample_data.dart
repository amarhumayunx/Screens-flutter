import 'package:flutter/material.dart';
import 'package:screen/glass_music_player/model/collection.dart';
import 'package:screen/glass_music_player/model/song.dart';
import '../constants/app_colors.dart';

class SampleData {
  // Sample songs
  static final List<Song> songs = [
    Song(
      id: '1',
      title: 'Shape of You',
      artist: 'Ed Sheeran',
      duration: Duration(minutes: 3, seconds: 53),
    ),
    Song(
      id: '2',
      title: 'Jessica feat. Bado',
      artist: 'Boys LAB',
      duration: Duration(minutes: 4, seconds: 12),
    ),
    Song(
      id: '3',
      title: 'Mi Cama',
      artist: 'Karol G',
      duration: Duration(minutes: 3, seconds: 28),
    ),
    Song(
      id: '4',
      title: 'Ona by tak chciała',
      artist: '',
      duration: Duration(minutes: 3, seconds: 45),
    ),
    Song(
      id: '5',
      title: 'Secrets',
      artist: 'Tiësto & KSHMR',
      duration: Duration(minutes: 4, seconds: 2),
    ),
  ];

  // Sample collections
  static final List<Collection> collections = [
    Collection(
      id: 'chillout',
      title: 'Chillout',
      description: 'Relaxing vibes for your downtime',
      songs: songs.take(3).toList(),
      themeColor: AppColors.chilloutColor,
    ),
    Collection(
      id: 'work',
      title: 'Work',
      description: 'Focus music for productivity',
      songs: songs.skip(1).take(3).toList(),
      themeColor: AppColors.workColor,
    ),
    Collection(
      id: 'spiritual',
      title: 'Spiritual',
      description: 'Music for the soul',
      songs: songs.skip(2).take(2).toList(),
      themeColor: AppColors.spiritualColor,
    ),
  ];

  // Get collection by ID
  static Collection? getCollectionById(String id) {
    try {
      return collections.firstWhere((collection) => collection.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get song by ID
  static Song? getSongById(String id) {
    try {
      return songs.firstWhere((song) => song.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get recommended songs
  static List<Song> get recommendedSongs => songs.take(4).toList();

  // Get currently playing song (for demo)
  static Song get currentlyPlayingSong => getSongById('5')!;
}