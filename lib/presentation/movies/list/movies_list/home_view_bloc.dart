// Dart imports:
import 'dart:async';

// Package imports:
import 'package:domain/exceptions.dart';
import 'package:domain/use_cases/get_movie_list_uc.dart';
import 'package:rxdart/rxdart.dart';

// Project imports:
import '../../../common/states/states.dart';
import 'home_view_model.dart';
import 'home_view_state.dart';

class HomeViewBloc {
  HomeViewBloc({
    required this.getMovieListUc,
  }) {
    _subscriptions.add(
      _tryStartMoviesController.stream
          .flatMap(
            (_) => _tryFetchMovies(),
          )
          .listen(_onStateChangeController.add),
    );
  }

  final GetMovieListUc getMovieListUc;

  final _subscriptions = CompositeSubscription();

  final _tryStartMoviesController = PublishSubject<void>();
  Sink<void> get tryStartMovies => _tryStartMoviesController.sink;

  final _onStateChangeController = BehaviorSubject<HomeViewState>();
  Stream<HomeViewState> get onStateChange => _onStateChangeController.stream;

  Stream<HomeViewState> _tryFetchMovies() async* {
    yield const Loading();

    try {
      yield Success(
        movieList: await getMovieListUc.getFuture(params: null).then(
              (moviesInDM) => moviesInDM
                  .map(
                    (movieInDM) => movieInDM.toVM(),
                  )
                  .toList(),
            ),
      );
    } on NoConnectionException {
      yield const NetworkError();
    } catch (e) {
      yield const Error();
    }
  }

  void dispose() {
    _tryStartMoviesController.close();
    _onStateChangeController.close();
    _subscriptions.dispose();
  }
}
