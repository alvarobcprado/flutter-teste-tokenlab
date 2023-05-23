// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:focus_detector/focus_detector.dart';

// Project imports:
import '../../../../intl_commons.dart';
import '../../../common/states/states.dart';
import '../../../common/widgets/manage_state_view.dart';
import 'favorites_bloc.dart';
import 'favorites_view_state.dart';
import 'widgets/favorites_view_success_state_widget.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({
    required this.bloc,
    Key? key,
  }) : super(key: key);
  static const routeName = 'favorites';
  final FavoritesBloc bloc;

  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final _focusDetectorKey = UniqueKey();

  // Computed property to help access the BLoC received in widget
  FavoritesBloc get _favoriteBloc => widget.bloc;

  @override
  void dispose() {
    super.dispose();
    _favoriteBloc.dispose();
  }

  @override
  Widget build(BuildContext context) => FocusDetector(
        key: _focusDetectorKey,
        onFocusGained: () => _favoriteBloc.onFocused.add(null),
        child: StreamBuilder<FavoritesViewState>(
          stream: _favoriteBloc.onStateChange,
          builder: (context, favoritesState) =>
              ManageStateView<Loading, Error, NetworkError, Success>(
            viewStateSnapshot: favoritesState,
            successView: (context, successData) => FavoritesViewSuccessState(
              favoriteMovieList: successData.favoriteMovieList,
            ),
            onTryAgain: () {},
            errorText: S.of(context).home_error_state,
          ),
        ),
      );
}
