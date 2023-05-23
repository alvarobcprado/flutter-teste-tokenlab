// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../../intl_commons.dart';
import '../../movie_list_gridview_widget.dart';
import '../home_view_model.dart';

///Widget para ser exibido quando a requisição da homeView for bem sucedida
class HomeViewSucessStateWidget extends StatefulWidget {
  const HomeViewSucessStateWidget({
    required this.moviesList,
    Key? key,
  }) : super(key: key);

  final List<HomeViewModel> moviesList;

  @override
  _HomeViewSucessStateWidgetState createState() =>
      _HomeViewSucessStateWidgetState();
}

class _HomeViewSucessStateWidgetState extends State<HomeViewSucessStateWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).home_appbar_title),
        ),
        body: MoviesGridViewWidget(
          moviesList: widget.moviesList,
        ),
      );
}
