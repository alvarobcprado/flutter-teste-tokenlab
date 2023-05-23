// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../../intl_commons.dart';
import '../../movie_list_gridview_widget.dart';
import '../favorites_view_model.dart';

class FavoritesViewSuccessState extends StatelessWidget {
  const FavoritesViewSuccessState({
    required this.favoriteMovieList,
    Key? key,
  }) : super(key: key);

  final List<FavoritesViewModel> favoriteMovieList;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).favorites_appbar_title),
        ),
        body: favoriteMovieList.isEmpty
            ? Center(
                child: Text(
                  S.of(context).favorites_empty,
                ),
              )
            : MoviesGridViewWidget(moviesList: favoriteMovieList),
      );
}
