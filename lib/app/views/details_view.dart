import 'package:flutter/material.dart';
import 'package:teste_tokenlab/app/models/movie_model.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argMovie = ModalRoute.of(context)!.settings.arguments as MovieModel;

    return Scaffold(
      appBar: AppBar(
        title: Text("Details page ${argMovie.title}"),
      ),
    );
  }
}
