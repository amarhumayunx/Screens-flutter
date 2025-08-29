import 'package:flutter/material.dart';

class PopularSong {
  final String id;
  final String title;
  final String artist;
  final String coverUrl;
  final Color backgroundColor;
  final String duration;
  final int playCount;
  final bool isExplicit;
  final DateTime releaseDate;

  const PopularSong({
    required this.id,
    required this.title,
    required this.artist,
    this.coverUrl = '',
    this.backgroundColor = Colors.grey,
    this.duration = '0:00',
    this.playCount = 0,
    this.isExplicit = false,
    required this.releaseDate,
  });

  factory PopularSong.fromJson(Map<String, dynamic> json) {
    return PopularSong(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      coverUrl: json['coverUrl'] ?? '',
      backgroundColor: Color(json['backgroundColor'] ?? Colors.grey),
      duration: json['duration'] ?? '0:00',
      playCount: json['playCount'] ?? 0,
      isExplicit: json['isExplicit'] ?? false,
      releaseDate: DateTime.parse(json['releaseDate'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'coverUrl': coverUrl,
      'backgroundColor': backgroundColor.value,
      'duration': duration,
      'playCount': playCount,
      'isExplicit': isExplicit,
      'releaseDate': releaseDate.toIso8601String(),
    };
  }

  PopularSong copyWith({
    String? id,
    String? title,
    String? artist,
    String? coverUrl,
    Color? backgroundColor,
    String? duration,
    int? playCount,
    bool? isExplicit,
    DateTime? releaseDate,
  }) {
    return PopularSong(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      coverUrl: coverUrl ?? this.coverUrl,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      duration: duration ?? this.duration,
      playCount: playCount ?? this.playCount,
      isExplicit: isExplicit ?? this.isExplicit,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PopularSong && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'PopularSong(id: $id, title: $title, artist: $artist)';
  }
}