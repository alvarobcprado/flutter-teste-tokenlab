import 'package:domain/data_repositories/movie_data_repository.dart';
import 'package:domain/entities/movie_detail.dart';
import 'package:domain/use_cases/use_case.dart';

class UpdateMovieFavoriteUc extends UseCase<UpdateMovieFavoriteUcParams, void> {
  UpdateMovieFavoriteUc({
    required this.repository,
  });
  final MovieDataRepository repository;
  @override
  Future<void> getRawFuture({
    required UpdateMovieFavoriteUcParams params,
  }) async =>
      repository.updateMovieFavorite(params.movieDetail);
}

class UpdateMovieFavoriteUcParams {
  const UpdateMovieFavoriteUcParams({
    required this.movieDetail,
  });
  final MovieDetail movieDetail;
}
