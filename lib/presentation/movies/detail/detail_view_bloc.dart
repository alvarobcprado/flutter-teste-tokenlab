// Dart imports:
import 'dart:async';

// Package imports:
import 'package:domain/entities/movie_detail.dart';
import 'package:domain/exceptions.dart';
import 'package:domain/use_cases/add_favorite_uc.dart';
import 'package:domain/use_cases/get_movie_detail_uc.dart';
import 'package:domain/use_cases/remove_favorite_uc.dart';
import 'package:domain/use_cases/update_movie_favorite_uc.dart';
import 'package:rxdart/rxdart.dart';

// Project imports:
import '../../common/states/states.dart';
import 'detail_view_state.dart';

class DetailViewBloc {
  DetailViewBloc({
    required this.movieId,
    required this.getMovieDetailUc,
    required this.updateMovieFavoriteUc,
    required this.addFavoriteUc,
    required this.removeFavoriteUc,
  }) {
    _subscriptions
      ..add(
        Rx.merge(
          <Stream>[Stream.value(null), _tryStartMovieDetailController],
        )
            .flatMap(
              (_) => _tryFetchMovieDetail(),
            )
            .listen(_onMovieDetailStateChangeController.add),
      )
      ..add(
        _toggleFavoriteController
            .flatMap(_toggleFavorite)
            .listen(_onMovieDetailStateChangeController.add),
      );
  }

  final int movieId;

  final GetMovieDetailUc getMovieDetailUc;
  final UpdateMovieFavoriteUc updateMovieFavoriteUc;
  final AddFavoriteUc addFavoriteUc;
  final RemoveFavoriteUc removeFavoriteUc;

  final _subscriptions = CompositeSubscription();

  final _tryStartMovieDetailController = PublishSubject<void>();
  Sink<void> get tryStartMovieDetail => _tryStartMovieDetailController.sink;

  final _onMovieDetailStateChangeController = PublishSubject<DetailViewState>();
  Stream<DetailViewState> get onMovieDetailStateChange =>
      _onMovieDetailStateChangeController.stream;

  final _onEventActionController = PublishSubject<EventActionState>();
  Stream<EventActionState> get onEventAction => _onEventActionController.stream;

  final _toggleFavoriteController = PublishSubject<MovieDetail>();
  Sink<MovieDetail> get toggleFavorite => _toggleFavoriteController.sink;

  Stream<DetailViewState> _tryFetchMovieDetail() async* {
    yield const Loading();
    try {
      yield Success(
        movieDetail: await getMovieDetailUc.getFuture(
          params: GetMovieDetailUcParams(movieId),
        ),
      );
    } on NoConnectionException {
      yield const NetworkError();
    } catch (e) {
      yield const Error();
    }
  }

  Stream<DetailViewState> _toggleFavorite(MovieDetail movieDetail) async* {
    try {
      movieDetail.isFavorite = !movieDetail.isFavorite;
      await updateMovieFavoriteUc.getFuture(
        params: UpdateMovieFavoriteUcParams(movieDetail: movieDetail),
      );
      if (movieDetail.isFavorite) {
        await addFavoriteUc.getFuture(
          params: AddFavoriteUcParams(movieId: movieId),
        );
        _onEventActionController.add(
          FavoriteAddedSnackbar(),
        );
      } else {
        await removeFavoriteUc.getFuture(
          params: RemoveFavoriteUcParams(movieId: movieId),
        );
        _onEventActionController.add(
          FavoriteRemovedSnackbar(),
        );
      }

      yield Success(movieDetail: movieDetail);
    } catch (error) {
      _onEventActionController.add(
        FavoriteErrorSnackbar(),
      );
    }
  }

  void dispose() {
    _tryStartMovieDetailController.close();
    _onMovieDetailStateChangeController.close();
    _onEventActionController.close();
    _subscriptions.dispose();
  }
}
