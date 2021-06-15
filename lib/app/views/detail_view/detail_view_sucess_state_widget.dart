import 'package:flutter/material.dart';
import 'package:teste_tokenlab/app/controllers/detail_controller.dart';
import 'package:teste_tokenlab/app/models/movie_model.dart';

class DetailViewSucessStateWidget extends StatelessWidget {
  const DetailViewSucessStateWidget(
      {Key? key, required this.movie, required this.controller})
      : super(key: key);

  final MovieModel movie;
  final DetailController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: FadeInImage(
                alignment: Alignment.topLeft,
                image: NetworkImage(
                  movie.posterUrl,
                ),
                placeholder: AssetImage('assets/images/placeholder.png'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/placeholder.png",
                      ),
                      Icon(Icons.warning),
                    ],
                  );
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Título: ${movie.title}"),
                  Text("Gênero(s): ${movie.genres.join(", ")}"),
                  Text("Data de lançamento: ${movie.releaseDate}"),
                  Text(
                      "Idioma original: ${controller.movieDetail!.originalLanguage.toUpperCase()}"),
                  Text("Nota média: ${movie.voteAverage}"),
                  Text("Popularidade: ${controller.movieDetail!.popularity}"),
                  Text("Número de votos: ${controller.movieDetail!.voteCount}"),
                  Text("ID: ${controller.movieDetail!.imdbId.toUpperCase()}"),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Divider(),
        Text("Sinopse:"),
        SizedBox(height: 5),
        Text(
          "${controller.movieDetail!.overview}",
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
