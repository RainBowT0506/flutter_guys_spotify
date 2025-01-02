import 'package:dartz/dartz.dart';
import 'package:flutter_guys_spotify/data/sources/song/song_firebase_service.dart';
import 'package:flutter_guys_spotify/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songID) async {
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSongs(songID);
  }

  @override
  Future<bool> isFavoriteSong(String songID) async {
    return await sl<SongFirebaseService>().isFavoriteSong(songID);
  }
}
