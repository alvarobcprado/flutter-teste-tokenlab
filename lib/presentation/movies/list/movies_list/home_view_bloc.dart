// Dart imports:
import 'dart:async';

// Package imports:
import 'package:domain/exceptions.dart';
import 'package:domain/use_cases/get_movie_list_uc.dart';
import 'package:re_state_action/re_state_action.dart';

// Project imports:
import 'home_view_model.dart';
import 'home_view_state.dart';

class HomeViewBloc extends ReStateEvent<HomeViewState, HomeViewEvent> {
  HomeViewBloc({
    required this.getMovieListUc,
  }) : super(const Loading()) {
    on<TryStartMovies>(_tryStartMovies);
  }

  final GetMovieListUc getMovieListUc;

  Future<void> _tryStartMovies(TryStartMovies event) async {
    emitState(const Loading());

    try {
      emitState(
        Success(
          movieList: await getMovieListUc.getFuture(params: null).then(
                (moviesInDM) => moviesInDM
                    .map(
                      (movieInDM) => movieInDM.toVM(),
                    )
                    .toList(),
              ),
        ),
      );
    } on NoConnectionException {
      emitState(const NetworkError());
    } catch (e) {
      emitState(const Error());
    }
  }
}
