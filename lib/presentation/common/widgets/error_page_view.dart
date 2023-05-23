// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../intl_commons.dart';
import 'error_state_view_widget.dart';

class ErrorPageView extends StatelessWidget {
  const ErrorPageView({
    required this.onTryAgain,
    required this.errorText,
    Key? key,
  }) : super(key: key);
  final VoidCallback onTryAgain;
  final String errorText;
  static const routeName = 'error';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).error_page_appbar),
        ),
        body: ErrorStateViewWidget(
          onTryAgain: onTryAgain,
          errorText: errorText,
        ),
      );
}
