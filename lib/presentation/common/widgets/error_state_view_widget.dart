// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../intl_commons.dart';

///Widget para ser exibido quando ocorrer algum erro na requisição da homeView
class ErrorStateViewWidget extends StatelessWidget {
  const ErrorStateViewWidget({
    required this.onTryAgain,
    required this.errorText,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTryAgain;
  final String errorText;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorText,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: onTryAgain,
              style: TextButton.styleFrom(
                primary: Colors.red,
                padding: const EdgeInsets.all(15),
                side: const BorderSide(
                  color: Colors.red,
                ),
              ),
              child: Text(S.of(context).error_page_try_again),
            ),
          ],
        ),
      );
}
