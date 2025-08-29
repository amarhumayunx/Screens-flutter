import 'dart:ui';
import '../models/single_model.dart';

class SinglesService {
  static List<SingleModel> getNewSingles() {
    return [
      const SingleModel(
        id: '1',
        title: 'Happier Than Ever',
        artist: 'Billie Eilish',
        coverUrl: 'https://i.scdn.co/image/ab67616d0000b273a91c10fe9472d9bd89802e5a',
        backgroundColor: Color(0xFF7ED321),
        duration: '4:58',
      ),
      const SingleModel(
        id: '2',
        title: 'Montero',
        artist: 'Lil Nas X',
        coverUrl: 'https://i.scdn.co/image/ab67616d0000b273be82673b5f79d9658ec0a9fd',
        backgroundColor: Color(0xFF2E3A59),
        duration: '2:17',
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

  static List<SingleModel> getTrendingSingles() {
    return getNewSingles().take(3).toList();
  }

  static SingleModel? getSingleById(String id) {
    try {
      return getNewSingles().firstWhere((single) => single.id == id);
    } catch (e) {
      return null;
    }
  }
}