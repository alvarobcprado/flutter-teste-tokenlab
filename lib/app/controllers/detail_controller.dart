import 'package:flutter/cupertino.dart';
import 'package:teste_tokenlab/app/models/movie_detail_model.dart';

import 'package:teste_tokenlab/app/repositories/movie_detail_repository.dart';

class DetailController {
  MovieDetailModel? movieDetail;
  final ValueNotifier<DetailState> state =
      ValueNotifier<DetailState>(DetailState.starting);

  final _movieDetailRepo = MovieDetailRepository();

  Future<MovieDetailModel?> start(int movieId) async {
    state.value = DetailState.loading;
    try {
      movieDetail = await _movieDetailRepo.fetchMovieDetail(movieId);
      state.value = DetailState.succesful;
    } catch (e) {
      print(e);
      state.value = DetailState.error;
    }
  }
}

enum DetailState {
  starting,
  loading,
  succesful,
  error,
}
