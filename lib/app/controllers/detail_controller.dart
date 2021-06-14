import 'package:flutter/cupertino.dart';
import 'package:teste_tokenlab/app/models/movie_model.dart';
import 'package:teste_tokenlab/app/repositories/movie_detail_repository.dart';

class DetailController {
  List<MovieModel> moviesList = [];
  final ValueNotifier<DetailState> state =
      ValueNotifier<DetailState>(DetailState.starting);

  final movieDetailRepo = MovieDetailRepository();
  Future start(int movieId) async {
    state.value = DetailState.loading;
    try {
      moviesList = await movieDetailRepo.fetchMovieDetail(movieId);
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
