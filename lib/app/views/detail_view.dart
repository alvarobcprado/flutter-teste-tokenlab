import 'package:flutter/material.dart';
import 'package:teste_tokenlab/app/controllers/detail_controller.dart';
import 'package:teste_tokenlab/app/models/movie_model.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  DetailController controller = DetailController();

  String mapList(List l) {
    return l.map((e) => '$e').toString();
  }

  manageState(DetailState state, MovieModel argMovie) {
    switch (state) {
      case DetailState.starting:
        return Container();

      case DetailState.loading:
        return Center(
          child: CircularProgressIndicator(),
        );

      case DetailState.error:
        return Center(
          child: TextButton(
            onPressed: () {
              controller.start(argMovie.id);
            },
            child: Text("Tentar Novamente"),
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(15),
              side: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        );

      case DetailState.succesful:
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
                      argMovie.posterUrl,
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
                      Text("Título: ${argMovie.title}"),
                      Text("Gênero(s): ${argMovie.genres.join(", ")}"),
                      Text("Data de lançamento: ${argMovie.releaseDate}"),
                      Text(
                          "Idioma original: ${controller.movieDetail!.originalLanguage.toUpperCase()}"),
                      Text("Nota média: ${argMovie.voteAverage}"),
                      Text(
                          "Popularidade: ${controller.movieDetail!.popularity}"),
                      Text(
                          "Número de votos: ${controller.movieDetail!.voteCount}"),
                      Text(
                          "ID: ${controller.movieDetail!.imdbId.toUpperCase()}"),
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

  @override
  Widget build(BuildContext context) {
    final argMovie = ModalRoute.of(context)!.settings.arguments as MovieModel;
    controller.start(argMovie.id);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
      ),
      body: ValueListenableBuilder<DetailState>(
        valueListenable: controller.state,
        builder: (BuildContext context, DetailState state, _) {
          return manageState(controller.state.value, argMovie);
        },
      ),
    );
  }
}
