// Package imports:
import 'package:domain/use_cases/get_movie_favorite_list_uc.dart';
import 'package:re_state_action/re_state_action.dart';

import 'favorites_view_model.dart';
import 'favorites_view_state.dart';

class FavoritesBloc
    extends ReStateEvent<FavoritesViewState, FavoritesViewEvent> {
  FavoritesBloc({
    required this.getMovieFavoriteListUc,
  }) : super(const Loading()) {
    on<TryStartFavorites>(_tryStartFavorites);
  }

  final GetMovieFavoriteListUc getMovieFavoriteListUc;

  Future<void> _tryStartFavorites(TryStartFavorites event) async {
    emitState(const Loading());

    try {
      emitState(
        Success(
          favoriteMovieList:
              await getMovieFavoriteListUc.getFuture(params: null).then(
                    (favoritesMoviesInDM) => favoritesMoviesInDM
                        .map(
                          (favoriteMovieInDM) => favoriteMovieInDM.toVM(),
                        )
                        .toList(),
                  ),
        ),
      );
    } catch (e) {
      emitState(const Error());
    }
  }
}
