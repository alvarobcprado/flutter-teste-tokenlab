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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final argMovie = ModalRoute.of(context)!.settings.arguments as MovieModel;
    final movieDetail = controller.start(argMovie.id);

    return Scaffold(
      appBar: AppBar(
        title: Text("Details page ${argMovie.title}"),
      ),
    );
  }
}
