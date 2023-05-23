// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../intl_commons.dart';
import 'error_page_view.dart';
import 'loading_state_widget.dart';

class ManageStateView<Loading, Error, NetworkError, Success>
    extends StatelessWidget {
  const ManageStateView({
    required this.viewStateSnapshot,
    required this.successView,
    required this.onTryAgain,
    required this.errorText,
    Key? key,
  }) : super(key: key);
  final AsyncSnapshot viewStateSnapshot;
  final Widget Function(BuildContext context, Success success) successView;
  final VoidCallback onTryAgain;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    if (viewStateSnapshot.hasError) {
      return ErrorPageView(onTryAgain: onTryAgain, errorText: errorText);
    }
    if (viewStateSnapshot.hasData) {
      final viewStateData = viewStateSnapshot.data;

      if (viewStateData is Loading) {
        return const LoadingStateWidget();
      }
      if (viewStateData is NetworkError) {
        return ErrorPageView(
          key: const ValueKey('errorPage'),
          onTryAgain: onTryAgain,
          errorText: S.of(context).common_network_error,
        );
      }
      if (viewStateData is Error) {
        return ErrorPageView(
          onTryAgain: onTryAgain,
          errorText: errorText,
          key: const ValueKey('errorPage'),
        );
      }
      if (viewStateData is Success) {
        return successView(context, viewStateData);
      }
    }
    return const LoadingStateWidget();
  }
}
