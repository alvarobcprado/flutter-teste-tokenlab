// Package imports:
import 'package:domain/entities/movie.dart';

// Project imports:
import '../movie_list_view_model.dart';

class HomeViewModel implements MovieListViewModel {
  HomeViewModel({
    required this.id,
    required this.title,
    required this.posterUrl,
  });
  @override
  final int id;
  @override
  final String title;
  @override
  final String posterUrl;
}

extension HomeViewMappers on Movie {
  HomeViewModel toVM() => HomeViewModel(
        id: id,
        title: title,
        posterUrl: posterUrl,
      );
}
