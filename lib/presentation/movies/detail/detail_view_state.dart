// ignore_for_file: public_member_api_docs, sort_constructors_first
// Package imports:
import 'package:domain/entities/movie_detail.dart';

// Project imports:
import '../../../intl_commons.dart';

sealed class DetailViewState {}

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

sealed class DetailViewAction {
  const DetailViewAction(
    this.snackbarText,
  );

  final String snackbarText;
}

class FavoriteAddedSnackbar extends DetailViewAction {
  FavoriteAddedSnackbar() : super(S.current.favorite_add);
}

class FavoriteRemovedSnackbar extends DetailViewAction {
  FavoriteRemovedSnackbar() : super(S.current.favorite_removed);
}

class FavoriteErrorSnackbar extends DetailViewAction {
  FavoriteErrorSnackbar() : super(S.current.favorite_error);
}

sealed class DetailViewEvent {}

class TryStartMovieDetail implements DetailViewEvent {
  const TryStartMovieDetail();
}

class ToggleFavorite implements DetailViewEvent {
  const ToggleFavorite({
    required this.movieDetail,
  });

  final MovieDetail movieDetail;
}
