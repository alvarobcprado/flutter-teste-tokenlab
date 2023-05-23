// Project imports:
import 'favorites_view_model.dart';

sealed class FavoritesViewState {}

class Success implements FavoritesViewState {
  const Success({required this.favoriteMovieList});
  final List<FavoritesViewModel> favoriteMovieList;
}

class Loading implements FavoritesViewState {
  const Loading();
}

class Error implements FavoritesViewState {
  const Error();
}

class NetworkError implements FavoritesViewState {
  const NetworkError();
}

sealed class FavoritesViewEvent {}

class TryStartFavorites implements FavoritesViewEvent {
  const TryStartFavorites();
}
