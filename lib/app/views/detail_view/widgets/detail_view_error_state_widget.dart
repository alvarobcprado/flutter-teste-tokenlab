import 'package:flutter/material.dart';
import 'package:teste_tokenlab/app/controllers/detail_controller.dart';
import 'package:teste_tokenlab/app/models/movie_model.dart';

///Widget para ser exibido quando ocorrer algum erro na requisição da detailView
class DetailViewErrorStateWidget extends StatelessWidget {
  const DetailViewErrorStateWidget(
      {Key? key, required this.movie, required this.controller})
      : super(key: key);

  final MovieModel movie;
  final DetailController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Algo inesperado aconteceu x.x",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          TextButton(
            onPressed: () {
              controller.start(movie.id);
            },
            child: Text("Tentar Novamente"),
            style: TextButton.styleFrom(
              primary: Colors.red,
              padding: EdgeInsets.all(15),
              side: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
