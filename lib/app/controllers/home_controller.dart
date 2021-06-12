import 'package:teste_tokenlab/app/models/movie_model.dart';
import 'package:teste_tokenlab/app/repositories/movie_repository.dart';

class HomeController {
  List<MovieModel> moviesList = [];
  final movieRepo = MovieRepository();
  Future start() async {
    moviesList = await movieRepo.fetchMovies();
  }

  HomeState state = HomeState.starting;
}

enum HomeState {
  starting,
  loading,
  succesful,
  error,
}
