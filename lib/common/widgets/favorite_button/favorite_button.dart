import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guys_spotify/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:flutter_guys_spotify/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:flutter_guys_spotify/domain/entities/song/song.dart';

import '../../../core/configs/theme/app_colors.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;

  const FavoriteButton({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FavoriteButtonCubit(),
        child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
          builder: (context, state) {
            if (state is FavoriteButtonInitial) {
              return IconButton(
                  onPressed: () {
                    context
                        .read<FavoriteButtonCubit>()
                        .favoriteButtonUpdated(songEntity.songID);
                  },
                  icon: Icon(
                    songEntity.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_outline_outlined,
                    size: 20,
                    color: AppColors.darkGrey,
                  ));
            }

            if (state is FavoriteButtonUpdated) {
              return IconButton(
                  onPressed: () {
                    context
                        .read<FavoriteButtonCubit>()
                        .favoriteButtonUpdated(songEntity.songID);
                  },
                  icon: Icon(
                    state.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_outline_outlined,
                    size: 20,
                    color: AppColors.darkGrey,
                  ));
            }

            return Container();
          },
        ));
  }
}
