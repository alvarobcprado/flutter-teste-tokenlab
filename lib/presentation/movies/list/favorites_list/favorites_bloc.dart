// Package imports:
import 'package:domain/use_cases/get_movie_favorite_list_uc.dart';
import 'package:rxdart/rxdart.dart';

// Project imports:
import '../../../common/states/states.dart';
import 'favorites_view_model.dart';
import 'favorites_view_state.dart';

class FavoritesBloc {
  FavoritesBloc({
    required this.getMovieFavoriteListUc,
  }) {
    _subscriptions.add(
      _onFocusedController.stream
          .flatMap(
            (_) => _fetchFavoriteMovies(),
          )
          .listen(_onStateChangeController.add),
    );
  }

  final GetMovieFavoriteListUc getMovieFavoriteListUc;

  final _subscriptions = CompositeSubscription();

  final _onStateChangeController = BehaviorSubject<FavoritesViewState>();
  Stream<FavoritesViewState> get onStateChange =>
      _onStateChangeController.stream;

  final _onFocusedController = PublishSubject<void>();
  Sink<void> get onFocused => _onFocusedController.sink;

  Stream<FavoritesViewState> _fetchFavoriteMovies() async* {
    yield const Loading();

    try {
      yield Success(
        favoriteMovieList:
            await getMovieFavoriteListUc.getFuture(params: null).then(
                  (favoritesMoviesInDM) => favoritesMoviesInDM
                      .map(
                        (favoriteMovieInDM) => favoriteMovieInDM.toVM(),
                      )
                      .toList(),
                ),
      );
    } catch (e) {
      yield const Error();
    }
  }

  void dispose() {
    _onStateChangeController.close();
    _onFocusedController.close();
    _subscriptions.dispose();
  }
}
