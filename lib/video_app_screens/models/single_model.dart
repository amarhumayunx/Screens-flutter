// File: lib/models/single_model.dart
import 'package:flutter/material.dart';

class SingleModel {
  final String id;
  final String title;
  final String artist;
  final String coverUrl;
  final Color backgroundColor;
  final bool isPlaying;
  final String? duration;
  final DateTime? releaseDate;

  const SingleModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.coverUrl,
    required this.backgroundColor,
    this.isPlaying = false,
    this.duration,
    this.releaseDate,
  });

  SingleModel copyWith({
    String? id,
    String? title,
    String? artist,
    String? coverUrl,
    Color? backgroundColor,
    bool? isPlaying,
    String? duration,
    DateTime? releaseDate,
  }) {
    return SingleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      coverUrl: coverUrl ?? this.coverUrl,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      isPlaying: isPlaying ?? this.isPlaying,
      duration: duration ?? this.duration,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SingleModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}