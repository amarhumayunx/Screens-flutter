import 'dart:ui';

import 'song.dart';

class Collection {
  final String id;
  final String title;
  final String? description;
  final String? imageUrl;
  final List<Song> songs;
  final Color? themeColor;

  const Collection({
    required this.id,
    required this.title,
    this.description,
    this.imageUrl,
    required this.songs,
    this.themeColor,
  });

  // Get song count
  int get songCount => songs.length;

  // Get total duration
  Duration get totalDuration {
    return songs.fold(
      Duration.zero,
          (total, song) => total + (song.duration ?? Duration.zero),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'songs': songs.map((song) => song.toJson()).toList(),
      'themeColor': themeColor?.value,
    };
  }

  // Create from JSON
  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      songs: (json['songs'] as List<dynamic>)
          .map((songJson) => Song.fromJson(songJson))
          .toList(),
      themeColor: json['themeColor'] != null
          ? Color(json['themeColor'])
          : null,
    );
  }

  // Copy with modifications
  Collection copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    List<Song>? songs,
    Color? themeColor,
  }) {
    return Collection(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      songs: songs ?? this.songs,
      themeColor: themeColor ?? this.themeColor,
    );
  }

  @override
  String toString() {
    return 'Collection{id: $id, title: $title, songCount: $songCount}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Collection &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}