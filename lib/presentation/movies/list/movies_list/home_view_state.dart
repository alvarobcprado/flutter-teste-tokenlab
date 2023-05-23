// Project imports:
import '../../../common/states/states.dart';
import 'home_view_model.dart';

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
