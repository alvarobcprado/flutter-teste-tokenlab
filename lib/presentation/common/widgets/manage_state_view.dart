// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../intl_commons.dart';
import 'error_page_view.dart';
import 'loading_state_widget.dart';

class ManageStateView<T, Loading extends T, Error extends T,
    NetworkError extends T, Success extends T> extends StatelessWidget {
  const ManageStateView({
    required this.viewState,
    required this.successView,
    required this.onTryAgain,
    required this.errorText,
    Key? key,
  }) : super(key: key);
  final T viewState;
  final Widget Function(BuildContext context, Success success) successView;
  final VoidCallback onTryAgain;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    switch (viewState) {
      case NetworkError():
        return ErrorPageView(
          key: const ValueKey('errorPage'),
          onTryAgain: onTryAgain,
          errorText: S.of(context).common_network_error,
        );
      case Error():
        return ErrorPageView(
          onTryAgain: onTryAgain,
          errorText: errorText,
          key: const ValueKey('errorPage'),
        );
      case Success():
        return successView(context, viewState as Success);
      default:
        return const LoadingStateWidget();
    }
  }
}
