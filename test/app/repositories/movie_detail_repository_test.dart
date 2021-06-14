import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tokenlab/app/models/movie_detail_model.dart';

import 'package:teste_tokenlab/app/repositories/movie_detail_repository.dart';

main() {
  final movieDetailRepo = MovieDetailRepository();
  test("Deve retornar os detalhes do filme pelo ID fornecido", () async {
    final MovieDetailModel movieDetail =
        await movieDetailRepo.fetchMovieDetail(238);
    expect(movieDetail.imdbId, 'tt0068646');
  });
}
