import 'package:domain/data_repositories/movie_data_repository.dart';
import 'package:domain/entities/movie_detail.dart';
import 'package:domain/use_cases/use_case.dart';

class GetMovieDetailUc extends UseCase<GetMovieDetailUcParams, MovieDetail> {
  GetMovieDetailUc({
    required this.repository,
  });
  final MovieDataRepository repository;

  @override
  Future<MovieDetail> getRawFuture({
    required GetMovieDetailUcParams params,
  }) async =>
      repository.fetchMovieDetail(
        params.movieId,
      );
}

class GetMovieDetailUcParams {
  const GetMovieDetailUcParams(this.movieId);

  final int movieId;
}
