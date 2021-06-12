import 'package:teste_tokenlab/app/models/movie_model.dart';
import 'package:teste_tokenlab/app/repositories/movie_repository.dart';

class HomeController {
  late List<MovieModel> moviesList;
  final movieRepo = MovieRepository();
  Future start() async {
    moviesList = await movieRepo.fetchMovies();
  }
}
