class Song {
  final String id;
  final String title;
  final String artist;
  final String? albumArt;
  final Duration? duration;
  final String? audioUrl;

  const Song({
    required this.id,
    required this.title,
    required this.artist,
    this.albumArt,
    this.duration,
    this.audioUrl,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'albumArt': albumArt,
      'duration': duration?.inSeconds,
      'audioUrl': audioUrl,
    };
  }

  // Create from JSON
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      albumArt: json['albumArt'],
      duration: json['duration'] != null
          ? Duration(seconds: json['duration'])
          : null,
      audioUrl: json['audioUrl'],
    );
  }

  // Copy with modifications
  Song copyWith({
    String? id,
    String? title,
    String? artist,
    String? albumArt,
    Duration? duration,
    String? audioUrl,
  }) {
    return Song(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      albumArt: albumArt ?? this.albumArt,
      duration: duration ?? this.duration,
      audioUrl: audioUrl ?? this.audioUrl,
    );
  }

  @override
  String toString() {
    return 'Song{id: $id, title: $title, artist: $artist}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Song &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}