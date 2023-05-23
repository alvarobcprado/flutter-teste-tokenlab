// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../detail/detail_view.dart';
import 'grid_image_widget.dart';
import 'movie_list_view_model.dart';

class MoviesGridViewWidget extends StatelessWidget {
  const MoviesGridViewWidget({
    required this.moviesList,
  });

  final List<MovieListViewModel> moviesList;

  @override
  Widget build(BuildContext context) => GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        itemCount: moviesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) {
          final movie = moviesList[index];
          return GestureDetector(
            key: ValueKey(movie.id),
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed(
                '${DetailsView.routeName}/${movie.id}',
              );
            },
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              elevation: 4,
              child: Column(
                children: [
                  GridImageWidget(posterUrl: movie.posterUrl),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        movie.title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
