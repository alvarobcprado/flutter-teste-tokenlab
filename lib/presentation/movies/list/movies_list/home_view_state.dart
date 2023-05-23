// Project imports:
import 'home_view_model.dart';

sealed class HomeViewState {}

class Success implements HomeViewState {
  const Success({required this.movieList});
  final List<HomeViewModel> movieList;
}

class Loading implements HomeViewState {
  const Loading();
}

class Error implements HomeViewState {
  const Error();
}

class NetworkError implements HomeViewState {
  const NetworkError();
}

sealed class HomeViewEvent {}

class TryStartMovies implements HomeViewEvent {
  const TryStartMovies();
}
