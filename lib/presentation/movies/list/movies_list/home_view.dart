// Flutter imports:
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';

// Project imports:
import '../../../../intl_commons.dart';
import '../../../common/states/states.dart';
import '../../../common/widgets/manage_state_view.dart';
import 'home_view_bloc.dart';
import 'home_view_state.dart';
import 'widgets/home_view_sucess_state_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    required this.bloc,
    Key? key,
  }) : super(key: key);
  static const routeName = 'home';

  final HomeViewBloc bloc;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Computed property to help access the BLoC received in widget
  HomeViewBloc get _homeBloc => widget.bloc;
  final focusGainedKey = UniqueKey();

  @override
  void dispose() {
    super.dispose();
    _homeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) => FocusDetector(
        key: focusGainedKey,
        onFocusGained: () => _homeBloc.tryStartMovies.add(null),
        child: StreamBuilder<HomeViewState>(
          stream: _homeBloc.onStateChange,
          builder: (context, homeState) =>
              ManageStateView<Loading, Error, NetworkError, Success>(
            viewStateSnapshot: homeState,
            successView: (context, successData) => HomeViewSucessStateWidget(
              key: const ValueKey('homeView-successState'),
              moviesList: successData.movieList,
            ),
            onTryAgain: () => _homeBloc.tryStartMovies.add(null),
            errorText: S.of(context).home_error_state,
          ),
        ),
      );
}
