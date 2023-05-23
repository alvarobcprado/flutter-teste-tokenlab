// Package imports:
import 'package:domain/entities/movie_detail.dart';

// Project imports:
import '../../../intl_commons.dart';
import '../../common/states/states.dart';

class Success implements DetailViewState {
  const Success({
    required this.movieDetail,
  });
  final MovieDetail movieDetail;
}

class Error implements DetailViewState {
  const Error();
}

class NetworkError implements DetailViewState {
  const NetworkError();
}

class Loading implements DetailViewState {
  const Loading();
}

class FavoriteAddedSnackbar implements EventActionState {
  FavoriteAddedSnackbar();

  final snackbarText = S.current.favorite_add;
}

class FavoriteRemovedSnackbar implements EventActionState {
  FavoriteRemovedSnackbar();

  final snackbarText = S.current.favorite_removed;
}

class FavoriteErrorSnackbar implements EventActionState {
  FavoriteErrorSnackbar();

  final snackbarText = S.current.favorite_error;
}
