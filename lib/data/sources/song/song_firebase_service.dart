import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_guys_spotify/domain/entities/song/song.dart';
import 'package:flutter_guys_spotify/domain/usecases/song/is_favorite_song.dart';

import '../../../service_locator.dart';
import '../../models/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();

  Future<Either> getPlayList();

  Future<Either> addOrRemoveFavoriteSongs(String songID);

  Future<bool> isFavoriteSong(String songID);
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        bool isFavorite = await sl<IsFavoriteSongUseCase>().call(
          params: element.reference.id
        );
        songModel.isFavorite = isFavorite;
        songModel.songID = element.reference.id;
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again.');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        bool isFavorite = await sl<IsFavoriteSongUseCase>().call(
            params: element.reference.id
        );
        songModel.isFavorite = isFavorite;
        songModel.songID = element.reference.id;
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again.');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songID) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      late bool isFavorite;
      var user = firebaseAuth.currentUser;
      String uID = user!.uid;

      QuerySnapshot favoritesSongs = await firebaseFirestore
          .collection("users")
          .doc(uID)
          .collection("Favorites")
          .where("songId", isEqualTo: songID)
          .get();

      if (favoritesSongs.docs.isNotEmpty) {
        await favoritesSongs.docs.first.reference.delete();
        isFavorite = false;
      } else {
        await firebaseFirestore
            .collection("Users")
            .doc(uID)
            .collection("Favorites")
            .add({"songId": songID, "addedDate": Timestamp.now()});
        isFavorite = true;
      }
      return Right(isFavorite);
    } catch (e) {
      return Left("An error occurred");
    }
  }

  @override
  Future<bool> isFavoriteSong(String songID) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = firebaseAuth.currentUser;
      String uID = user!.uid;

      QuerySnapshot favoritesSongs = await firebaseFirestore
          .collection("users")
          .doc(uID)
          .collection("Favorites")
          .where("songId", isEqualTo: songID)
          .get();

      if (favoritesSongs.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
