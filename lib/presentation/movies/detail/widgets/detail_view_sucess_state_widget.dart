// Flutter imports:
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../../../intl_commons.dart';
import '../detail_view_model.dart';
import 'detail_image_widget.dart';

///Widget para ser exibido quando a requisição da detailView for bem sucedida
class DetailViewSucessStateWidget extends StatelessWidget {
  const DetailViewSucessStateWidget({
    required this.movieDetail,
    required this.toggleFavorite,
    Key? key,
  }) : super(key: key);

  final DetailViewModel movieDetail;
  final VoidCallback toggleFavorite;

  @override
  Widget build(BuildContext context) {
    final title = movieDetail.title;
    final genres = movieDetail.genres.join(', ');
    final releaseDate = movieDetail.releaseDate;
    final originalLanguage = movieDetail.originalLanguage.toUpperCase();
    final voteAverage = movieDetail.voteAverage;
    final popularity = movieDetail.popularity;
    final voteCount = movieDetail.voteCount;
    final imdbId = movieDetail.imdbId.toUpperCase();
    final overview = movieDetail.overview;
    final isFavorite = movieDetail.isFavorite;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).detail_appbar_title),
        actions: [
          IconButton(
            onPressed: () {
              final auxString = isFavorite ? 'removed' : 'added';
              context.read<FirebaseAnalytics>().logEvent(
                name: 'favorite_movie_$auxString',
                parameters: <String, dynamic>{
                  'movie_name': title,
                  'movie_popularity': popularity,
                  'movie_imdb_id': imdbId,
                },
              );
              toggleFavorite();
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DetailImageWidget(posterUrl: movieDetail.posterUrl),
              const SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(S.of(context).detail_movie_title(title)),
                    Text(
                      S.of(context).detail_movie_genre(
                          movieDetail.genres.length, genres),
                    ),
                    Text(S.of(context).detail_movie_release_date(releaseDate)),
                    Text(
                      S
                          .of(context)
                          .detail_movie_original_language(originalLanguage),
                    ),
                    Text(S.of(context).detail_movie_vote_average(voteAverage)),
                    Text(S.of(context).detail_movie_popularity(popularity)),
                    Text(S.of(context).detail_movie_vote_count(voteCount)),
                    Text(S.of(context).detail_movie_id(imdbId)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Divider(),
          Text(S.of(context).detail_movie_overview_title),
          const SizedBox(height: 5),
          Text(
            '$overview',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
