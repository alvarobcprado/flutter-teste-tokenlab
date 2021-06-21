import 'package:flutter/material.dart';
import 'package:teste_tokenlab/app/controllers/detail_controller.dart';
import 'package:teste_tokenlab/app/models/movie_model.dart';
import 'package:teste_tokenlab/app/views/detail_view/widgets/detail_view_sucess_state_widget.dart';
import 'package:teste_tokenlab/app/views/shared/error_state_view_widget.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  DetailController controller = DetailController();

  ///Gerenciador local de exibição de widgets de acordo com o estado da requisição
  Widget manageState(DetailState state, MovieModel argMovie) {
    switch (state) {
      case DetailState.starting:
        return Container();

      case DetailState.loading:
        return Center(
          child: CircularProgressIndicator(),
        );

      case DetailState.error:
        return ErrorStateViewWidget(
          func: () => controller.start(argMovie.id),
        );

      case DetailState.succesful:
        return DetailViewSucessStateWidget(
            movie: argMovie, controller: controller);
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
