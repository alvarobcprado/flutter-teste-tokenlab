// Dart imports:
import 'dart:async';

// Package imports:
import 'package:domain/exceptions.dart';
import 'package:domain/use_cases/add_favorite_uc.dart';
import 'package:domain/use_cases/get_movie_detail_uc.dart';
import 'package:domain/use_cases/remove_favorite_uc.dart';
import 'package:domain/use_cases/update_movie_favorite_uc.dart';
import 'package:re_state_action/re_state_action.dart';

// Project imports:
import 'detail_view_state.dart';

class DetailViewBloc extends ReStateActionEvent<DetailViewState,
    DetailViewAction, DetailViewEvent> {
  DetailViewBloc({
    required this.movieId,
    required this.getMovieDetailUc,
    required this.updateMovieFavoriteUc,
    required this.addFavoriteUc,
    required this.removeFavoriteUc,
  }) : super(const Loading()) {
    on<TryStartMovieDetail>(_tryStartMovieDetail);
    on<ToggleFavorite>(_toggleFavorite);

    process(const TryStartMovieDetail());
  }

  final int movieId;

  final GetMovieDetailUc getMovieDetailUc;
  final UpdateMovieFavoriteUc updateMovieFavoriteUc;
  final AddFavoriteUc addFavoriteUc;
  final RemoveFavoriteUc removeFavoriteUc;

  Future<void> _tryStartMovieDetail(TryStartMovieDetail event) async {
    emitState(const Loading());
    try {
      emitState(
        Success(
          movieDetail: await getMovieDetailUc.getFuture(
            params: GetMovieDetailUcParams(movieId),
          ),
        ),
      );
    } on NoConnectionException {
      emitState(const NetworkError());
    } catch (e) {
      emitState(const Error());
    }
  }

  Future<void> _toggleFavorite(ToggleFavorite event) async {
    try {
      final movieDetail = event.movieDetail;
      movieDetail.isFavorite = !movieDetail.isFavorite;
      await updateMovieFavoriteUc.getFuture(
        params: UpdateMovieFavoriteUcParams(movieDetail: movieDetail),
      );
      if (movieDetail.isFavorite) {
        await addFavoriteUc.getFuture(
          params: AddFavoriteUcParams(movieId: movieId),
        );
        emitAction(
          FavoriteAddedSnackbar(),
        );
      } else {
        await removeFavoriteUc.getFuture(
          params: RemoveFavoriteUcParams(movieId: movieId),
        );
        emitAction(
          FavoriteRemovedSnackbar(),
        );
      }

      emitState(Success(movieDetail: movieDetail));
    } catch (error) {
      emitAction(
        FavoriteErrorSnackbar(),
      );
    }
  }
}
