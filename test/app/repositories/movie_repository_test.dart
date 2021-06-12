import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tokenlab/app/models/movie_model.dart';
import 'package:teste_tokenlab/app/repositories/movie_repository.dart';

main() {
  final movieRepo = MovieRepository();
  test("Deve retornar uma lista de movies model", () async {
    final List<MovieModel> movies = await movieRepo.fetchMovies();
    expect(movies[3].id, 372058);
  });
}
