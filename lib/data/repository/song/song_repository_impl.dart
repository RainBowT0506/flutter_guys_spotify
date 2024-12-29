
import 'package:dartz/dartz.dart';
import 'package:flutter_guys_spotify/data/sources/song/song_firebase_service.dart';
import 'package:flutter_guys_spotify/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class SongRepositoryImpl extends SongsRepository{
  @override
  Future<Either> getNewsSongs() async{
    return await sl<SongFirebaseService>().getNewsSongs();
  }

}