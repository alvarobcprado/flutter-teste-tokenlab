// Package imports:
import 'package:domain/entities/movie.dart';

// Project imports:
import '../movie_list_view_model.dart';

class FavoritesViewModel implements MovieListViewModel {
  FavoritesViewModel({
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

extension FavoritesViewMappers on Movie {
  FavoritesViewModel toVM() =>
      FavoritesViewModel(id: id, title: title, posterUrl: posterUrl);
}
