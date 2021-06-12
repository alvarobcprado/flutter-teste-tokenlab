import 'package:flutter/cupertino.dart';
import 'package:teste_tokenlab/app/models/movie_model.dart';
import 'package:teste_tokenlab/app/repositories/movie_repository.dart';

class HomeController {
  List<MovieModel> moviesList = [];
  final ValueNotifier<HomeState> state =
      ValueNotifier<HomeState>(HomeState.starting);

  final movieRepo = MovieRepository();
  Future start() async {
    state.value = HomeState.loading;
    try {
      moviesList = await movieRepo.fetchMovies();
      state.value = HomeState.succesful;
    } catch (e) {
      print(e);
      state.value = HomeState.error;
    }
  }
}

enum HomeState {
  starting,
  loading,
  succesful,
  error,
}
