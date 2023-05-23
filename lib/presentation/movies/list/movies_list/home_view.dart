// Flutter imports:
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:re_state_action/re_state_action.dart';

// Project imports:
import '../../../../intl_commons.dart';
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
        onFocusGained: () => _homeBloc.process(const TryStartMovies()),
        child: ReStateWidget(
          reState: _homeBloc,
          builder: (context, homeState, _) => ManageStateView<HomeViewState,
              Loading, Error, NetworkError, Success>(
            viewState: homeState,
            successView: (context, successData) => HomeViewSucessStateWidget(
              key: const ValueKey('homeView-successState'),
              moviesList: successData.movieList,
            ),
            onTryAgain: () => _homeBloc.process(const TryStartMovies()),
            errorText: S.of(context).home_error_state,
          ),
        ),
      );
}
