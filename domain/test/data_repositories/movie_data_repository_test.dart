import 'package:domain/data_repositories/movie_data_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'movie_data_repository_test.mocks.dart';

@GenerateMocks([MovieDataRepository])
void main() {
  final mockMovieDataRepository = MockMovieDataRepository();
  test(
    'should a mocked instance of MovieDataRepository',
    () {
      expect(mockMovieDataRepository, isA<MovieDataRepository>());
    },
  );
}
