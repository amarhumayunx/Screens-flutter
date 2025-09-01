import 'package:flutter/material.dart';
import 'package:screen/chatbot/screens/chatbot_screen.dart';
import 'package:screen/glass_music_player/music_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChatbotScreen(),
    );
  }
}