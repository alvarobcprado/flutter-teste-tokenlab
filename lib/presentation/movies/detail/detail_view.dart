// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:rxdart/rxdart.dart';

// Project imports:
import '../../../intl_commons.dart';
import '../../common/states/states.dart';
import '../../common/widgets/manage_state_view.dart';
import 'detail_view_bloc.dart';
import 'detail_view_model.dart';
import 'detail_view_state.dart';
import 'widgets/detail_view_sucess_state_widget.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({
    required this.movieId,
    required this.bloc,
    Key? key,
  }) : super(key: key);
  static const routeName = 'details';
  final int movieId;
  final DetailViewBloc bloc;

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final _detailViewSubscriptions = CompositeSubscription();

  // Computed property to help access the BLoC received in widget
  DetailViewBloc get _detailBloc => widget.bloc;

  @override
  void dispose() {
    super.dispose();
    _detailBloc.dispose();
    _detailViewSubscriptions.clear();
  }

  void _toggleFavoriteSnackBar(BuildContext context, snackbarEvent) {
    final favoriteSnackbar = SnackBar(
      content: Text(
        snackbarEvent.snackbarText,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      width: snackbarEvent.snackbarText.length * 9.0,
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(favoriteSnackbar);
  }

  @override
  Widget build(BuildContext context) {
    _detailViewSubscriptions.add(
      _detailBloc.onEventAction.listen(
        (snackBar) => _toggleFavoriteSnackBar(context, snackBar),
      ),
    );
    return StreamBuilder<DetailViewState>(
      stream: _detailBloc.onMovieDetailStateChange,
      builder: (context, detailStateSnap) =>
          ManageStateView<Loading, Error, NetworkError, Success>(
        viewStateSnapshot: detailStateSnap,
        successView: (context, detailSuccess) => DetailViewSucessStateWidget(
          movieDetail: detailSuccess.movieDetail.toVM(),
          toggleFavorite: () =>
              _detailBloc.toggleFavorite.add(detailSuccess.movieDetail),
        ),
        onTryAgain: () => _detailBloc.tryStartMovieDetail.add(null),
        errorText: S.of(context).detail_error_state,
      ),
    );
  }
}
