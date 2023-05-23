import 'package:domain/data_repositories/movie_data_repository.dart';
import 'package:domain/use_cases/use_case.dart';

class AddFavoriteUc extends UseCase<AddFavoriteUcParams, void> {
  AddFavoriteUc({required this.repository});
  final MovieDataRepository repository;

  @override
  Future<void> getRawFuture({required AddFavoriteUcParams params}) =>
      repository.addFavorite(params.movieId);
}

class AddFavoriteUcParams {
  const AddFavoriteUcParams({required this.movieId});

  final int movieId;
}
