// Project imports:
import '../../../common/states/states.dart';
import 'favorites_view_model.dart';

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
