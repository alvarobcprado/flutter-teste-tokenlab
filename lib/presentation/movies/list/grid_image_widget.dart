// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

class GridImageWidget extends StatelessWidget {
  const GridImageWidget({
    required this.posterUrl,
    Key? key,
  }) : super(key: key);

  final String posterUrl;

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 10,
        child: Container(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: posterUrl,
              fit: BoxFit.cover,
              placeholder: (ctx, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (ctx, url, error) => const Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
        ),
      );
}
