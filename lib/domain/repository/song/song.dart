import 'package:dartz/dartz.dart';

abstract class SongsRepository {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavoriteSongs(String songID);
  Future<bool> isFavoriteSong(String songID);
}
