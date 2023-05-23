abstract class MovieListViewModel {
  MovieListViewModel({
    required this.id,
    required this.title,
    required this.posterUrl,
  });

  final int id;
  final String title;
  final String posterUrl;
}
