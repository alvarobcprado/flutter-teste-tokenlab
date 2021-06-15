import 'package:flutter/material.dart';
import 'package:teste_tokenlab/app/controllers/detail_controller.dart';
import 'package:teste_tokenlab/app/models/movie_model.dart';

class DetailViewErrorStateWidget extends StatelessWidget {
  const DetailViewErrorStateWidget(
      {Key? key, required this.movie, required this.controller})
      : super(key: key);

  final MovieModel movie;
  final DetailController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          controller.start(movie.id);
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
  }
}
