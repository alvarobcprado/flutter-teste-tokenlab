import 'package:domain/data_repositories/movie_data_repository.dart';
import 'package:domain/entities/movie.dart';
import 'package:domain/use_cases/use_case.dart';

class GetMovieFavoriteListUc extends UseCase<void, List<Movie>> {
  GetMovieFavoriteListUc({
    required this.repository,
  });
  final MovieDataRepository repository;

  @override
  Future<List<Movie>> getRawFuture({required void params}) async =>
      repository.fetchMovieFavoriteList();
}
