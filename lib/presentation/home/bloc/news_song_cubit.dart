import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guys_spotify/domain/usecases/song/get_news_songs.dart';
import 'package:flutter_guys_spotify/presentation/home/bloc/new_song_state.dart';

import '../../../service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();
    returnedSongs.fold((l) {
      emit(NewsSongsLoadFailure());
    }, (data) {
      emit(NewsSongLoaded(songs: data));
    });
  }
}
