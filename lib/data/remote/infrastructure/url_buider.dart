class PathBuilder {
  static const _baseUrl = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/';
  static const _moviesResource = 'movies';

  static String movies() => '$_baseUrl$_moviesResource';

  static String movieDetail(int id) => '$_baseUrl$_moviesResource/$id';
}
