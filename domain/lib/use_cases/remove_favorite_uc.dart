import 'package:domain/data_repositories/movie_data_repository.dart';
import 'package:domain/use_cases/use_case.dart';

class RemoveFavoriteUc extends UseCase<RemoveFavoriteUcParams, void> {
  RemoveFavoriteUc({
    required this.repository,
  });
  final MovieDataRepository repository;

  @override
  Future<void> getRawFuture({
    required RemoveFavoriteUcParams params,
  }) =>
      repository.removeFavorite(params.movieId);
}

class RemoveFavoriteUcParams {
  RemoveFavoriteUcParams({required this.movieId});
  final int movieId;
}
