import 'package:dartz/dartz.dart';
import 'package:flutter_guys_spotify/data/repository/song/song_repository_impl.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepositoryImpl>().getNewsSongs();
  }
}
