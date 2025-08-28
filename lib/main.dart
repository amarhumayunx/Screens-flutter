import 'package:flutter/material.dart';
import 'package:screen/screens/booking_screen.dart';
import 'package:screen/screens/hotel_detail_screen.dart';
import 'package:screen/screens/login_screen.dart';
import 'package:screen/video_app_screens/music_home_screen.dart';

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
      home: MusicHomeScreen(),
    );
  }
}