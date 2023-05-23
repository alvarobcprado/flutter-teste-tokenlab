// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:

class DetailImageWidget extends StatelessWidget {
  const DetailImageWidget({
    required this.posterUrl,
    Key? key,
  }) : super(key: key);

  final String posterUrl;

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 3,
        child: FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage(posterUrl),
          placeholder: const AssetImage('assets/images/placeholder.png'),
          imageErrorBuilder: (_, e, s) => Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/placeholder.png'),
              const Icon(Icons.warning),
            ],
          ),
        ),
      );
}
